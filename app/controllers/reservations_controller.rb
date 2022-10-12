class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new
    @room = Room.find(params[:id])
    @user_id = current_user.id

  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(id: @reservation.room_id)
    render :new if @reservation.invalid?
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if params[:back].present?
      render :new
      return
    elsif @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservations_url
    end
  end
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :reservations
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_people, :room_id, :user_id)
  end

end
