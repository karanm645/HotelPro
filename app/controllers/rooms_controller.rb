class RoomsController < ApplicationController
  def index
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @rooms = @property.rooms
  end 
  
  def show 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @room = @property.rooms.find(params[:id])
  end 
  def new
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @room = Room.new
  end 
  
  def create 
    user = current_user
    property = user.properties.find(params[:property_id])
    room = property.rooms.create!(room_params)
    room.save
    redirect_to user_property_path(user, property)
  end 

  def edit 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @room = @property.rooms.find(params[:id])
  end 

  def update 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @room = @property.rooms.find(params[:id])
    @room.update(room_params)
    @room.save 
    redirect_to user_property_room_path(@user, @property, @room)
  end 

  def destroy 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @room = @property.rooms.find(params[:id])
    @room.destroy
    redirect_to user_property_rooms_path(@user, @property)
  end 

  private
  def room_params
    params.require(:room).permit(:room_type, :price, :smoking, :count, :room_number)
  end 
end 