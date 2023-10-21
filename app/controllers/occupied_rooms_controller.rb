class OccupiedRoomsController < ApplicationController
  def show
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.find(params[:reservation_id])
    @occupied_room = @reservation.occupied_rooms.find_by(params[:occupied_room_id])
  end 
  
  def index 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.find(params[:reservation_id])
    @occupied_rooms = @reservation.occupied_rooms
  end 
  
  def new
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.find(params[:reservation_id])
    @all_rooms = @property.rooms
    @vacant_rooms = @all_rooms.vacant_rooms
    @occupied_room = @reservation.occupied_rooms.new
  end 
  
  def create 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.find(params[:reservation_id])
    @occupied_room = @reservation.occupied_rooms.create!(occupied_params)
    if @occupied_room.save
      redirect_to user_property_dashboards_path(@user, @property), notice: 'Room checked in successfully.'
    else 
      redirect_to user_property_guest_reservations_path(@user, @property, @guest), alert: 'Failed to check in room.'
    end 
  end 

  def destroy
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.find(params[:reservation_id])
    @occupied_room = @reservation.occupied_rooms.find_by(params[:occupied_room_id])
    
    #@guest.reservations.destroy_all
    @occupied_room.destroy
    redirect_to user_property_dashboards_path(@user, @property)
  end 
   private

  def occupied_params
    params.require(:occupied_room).permit(:room_id, :reservation_id)
  end 
end 