class GuestsController < ApplicationController

  def index 
    @user = current_user
    @property = @user.properties.find_by(params[:property_id])
    @guests = @property.guests.all
  end 
  
  def new
    @guest = Guest.new
  end 

  def create 
    user = current_user
    property = @user.properties.find_by(params[:property_id])
    guest = property.guests.create!(guest_params)
    guest.save 
    # change this redirect to reservation form later
    redirect_to guests_path(guest)  
  end

  private

  def guest_params 
    params.require(:guest).permit(:first_name, :last_name, :phone_number)
  end 
end