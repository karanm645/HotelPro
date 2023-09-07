class ReservationsController < ApplicationController

  def index 
    @guest = Guest.find(params[:guest_id])
    @reservations = @guest.reservations
  end 

  def show
    @guest = Guest.find(params[:id])
    @reservation = @guest.reservations.find_by(params[:reservation_id])
  end 
  
  def new
    @property = Property.find_by(params[:property_id])
    @guest = Guest.find(params[:guest_id])
    @reservation = Reservation.new
  end 

  def create 
    #@property = Property.find_by(params[:property_id])
    @guest = Guest.find(params[:guest_id])
    @reservation = @guest.reservations.create!(reservation_params)
    
    @reservation.save 
    redirect_to guest_reservations_path(@guest)
  end

  private

  def reservation_params 
    params.require(:reservation).permit(:date_in, :date_out)
  end 
end