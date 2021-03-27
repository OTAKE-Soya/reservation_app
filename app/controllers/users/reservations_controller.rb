class Users::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    p @today = Date.today + 1
    @repete_counts = 45 
  end

  def show
  end

  def new
    @reservation = Reservation.new
    p Reservation.all
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
  
  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :name, :date, :period)
  end
end