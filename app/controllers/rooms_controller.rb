class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end 
  
  def new
    @room = Room.new
  end 
  
  def create 
    property = Property.find_by(params[:property_id])
    room = property.rooms.create!(room_params)
    room.save
    redirect_to "/dashboard"
  end 

  private
  def room_params
    params.require(:room).permit(:room_type, :price, :smoking, :count, :room_number)
  end 
end 