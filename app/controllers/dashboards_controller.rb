class DashboardsController < ApplicationController
  def index 
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @guest = @property.guests.find_by(params[:guest_id])
    @rooms = @property.rooms.all
    @reservation = @guest.reservations.find_by(params[:reservation_id])
    @all_guests = @property.guests
    @occupied_rooms = @reservation.occupied_rooms
    @occupied_room = @reservation.occupied_rooms.find_by(params[:occupied_room_id])
    #@occupied_room = @reservation.occupied_rooms.all
  end 
end 
