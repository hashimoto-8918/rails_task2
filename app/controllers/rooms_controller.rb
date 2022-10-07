class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_area, :room_image))
    if @room.save
      flash[:notice] = "ルーム登録が完了しました。"
      redirect_to :rooms
    else
      render "new"
    end
  end
  def search
    @rooms = Room.all
  end
end
