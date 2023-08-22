class GuestsController < ApplicationController

  def index 
    @guests = Guest.all
  end 
  
  def new
    @guest = Guest.new
  end 

  def create 
    guest = Guest.create!(guest_params)
    guest.save 
    # change this redirect to reservation form later
    redirect_to guests_path(guest)  
  end

  private

  def guest_params 
    params.require(:guest).permit(:first_name, :last_name, :phone_number)
  end 
end