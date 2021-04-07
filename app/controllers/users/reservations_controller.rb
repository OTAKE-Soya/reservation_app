class Users::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @today = Date.today
    @repete_counts = 21
    if params[:page]
      @page = params[:page].to_i
    else
      @page = 0
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
    @reservation.date = params[:date]
    @reservation.period = params[:period]
    @bands = Band.joins(:band_members).where(band_members: {user_id: current_user.id})
  end
  
  def create
    reservation = Reservation.new(reservation_params)
    unless Reservation.find_by(date: reservation.date, period: reservation.period)
      reservation.save
    end
    redirect_to reservations_path
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end
  
  def update
    reservation = Reservation.find(params[:id])
    reservation.name = reservation_params[:name]
    reservation.date = reservation_params[:date]
    reservation.period = reservation_params[:period]
    unless Reservation.find_by(date: reservation.date, period: reservation.period)
      reservation.save
    end
    redirect_to reservations_path
  end
  
  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to reservations_path
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :name, :date, :period)
  end
end