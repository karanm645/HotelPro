class ReservationsController < ApplicationController

  def index 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservations = @guest.reservations
  end 

  def show
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.find_by(params[:reservation_id])
  end 
  
  def new
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.new
  end 

  def create 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.create!(reservation_params)
    
    @reservation.save 
    redirect_to user_property_guest_reservations_path(@user, @property, @guest)
  end

  private

  def reservation_params 
    params.require(:reservation).permit(:date_in, :date_out)
  end 
end