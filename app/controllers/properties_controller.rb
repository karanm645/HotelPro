class PropertiesController < ApplicationController
  def index
    user = User.find_by(params[:user_id])
    @properties = user.properties.all
  end 

  def new 
    @property = Property.new
  end 
  
  def create
    user = User.find_by(params[:user_id])
    property = user.properties.create!(property_params)
    property.save 
    redirect_to user
  end 



  private

  def property_params
    params.require(:property).permit(:name, :street, :city, :state, :zip_code, :phone_number)
  end 
end