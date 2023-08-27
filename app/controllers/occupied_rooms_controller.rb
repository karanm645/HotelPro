class OccupiedRoomsController < ApplicationController
  def show
    @user = current_user
    @property = @user.properties.find_by(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.find(params[:reservation_id])
    @occupied_room = @reservation.occupied_rooms.find_by(params[:occupied_room_id])
  end 
  
  def index 
    @user = current_user
    @property = @user.properties.find_by(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.find(params[:reservation_id])
    @occupied_rooms = @reservation.occupied_rooms
  end 
  
  def new
    @user = current_user
    @property = @user.properties.find_by(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.find(params[:reservation_id])
    @occupied_room = @reservation.occupied_rooms.new
  end 
  
  def create 
    @user = current_user
    @property = @user.properties.find_by(params[:property_id])
    @guest = @property.guests.find(params[:guest_id])
    @reservation = @guest.reservations.find(params[:reservation_id])
    @occupied_room = @reservation.occupied_rooms.create!(occupied_params)
    if @occupied_room.save
      redirect_to guest_reservation_occupied_room_path(@guest, @reservation, @occupied_room), notice: 'Room checked in successfully.'
    else 
      redirect_to guest_reservations_path(@guest), alert: 'Failed to check in room.'
    end 
  end 
   private

  def occupied_params
    params.require(:occupied_room).permit(:room_id, :reservation_id)
  end 
end 