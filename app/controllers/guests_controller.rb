class GuestsController < ApplicationController
  def index 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guests = @property.guests.all
  end 

  def show 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find_by(params[:guest_id])
  end
  
  
  def new
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.new
  end 

  def create 
    user = current_user
    property = user.properties.find(params[:property_id])
    guest = property.guests.create!(guest_params)
    guest.save 
    # change this redirect to reservation form later
    redirect_to new_user_property_guest_reservation_path(user, property, guest) 
  end

  def edit
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:id])
  end 

  def update
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:id])
    @guest.update(guest_params)
    @guest.save 
    redirect_to user_property_guests_path(@user, @property) 
  end 

  def destroy
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find_by(params[:guest_id])
    
    @guest.reservations.destroy_all
    @guest.destroy
    redirect_to user_property_guests_path(@user, @property)
  end 

  private

  def guest_params 
    params.require(:guest).permit(:first_name, :last_name, :phone_number)
  end 
end