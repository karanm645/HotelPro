class ReservationsController < ApplicationController

  def index 
    #@user = current_user
    #@property = @user.properties.find_by(params[:property_id])
    #@guests = @property.guests.all
    @guest = Guest.find(params[:guest_id])
    @reservations = @guest.reservations
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