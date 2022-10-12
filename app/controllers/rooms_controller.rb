class RoomsController < ApplicationController
  def index
    @rooms = Room.where(user_id: current_user.id)
  end

  def new
    @room = Room.new
    @user_id = current_user.id
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_area, :room_image, :user_id))
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルーム登録が完了しました。"
      redirect_to :rooms
    else
      render "new"
    end
  end
  def search
    if params[:area]
      @rooms = Room.where(["room_area like?", "%#{params[:area]}%"])
      @count_search = Room.where(["room_area like?", "%#{params[:area]}%"]).count
    elsif params[:keyword]
      @rooms = Room.where(["room_name like? or room_area like? or room_introduction like?" , "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%" ])
      @count_search = Room.where(["room_name like? or room_area like? or room_introduction like?" , "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%" ]).count
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :rooms
  end
end
