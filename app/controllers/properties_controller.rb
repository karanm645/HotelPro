class PropertiesController < ApplicationController
  def index
    @user = current_user
    @properties = @user.properties.all
  end 

  def show 
    @user = current_user
    @property = @user.properties.find(params[:id])
  end 

  def new 
    user = current_user
    @property = user.properties.new
  end 
  
  def create
    user = current_user
    property = user.properties.create!(property_params)
    property.save 
    redirect_to user_property_path(user, property)
  end 



  private

  def property_params
    params.require(:property).permit(:name, :street, :city, :state, :zip_code, :phone_number)
  end 
end