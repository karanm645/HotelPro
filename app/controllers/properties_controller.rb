class PropertiesController < ApplicationController
  def new 
    @property = Property.new
  end 
  
  def create
    user = User.find_by(params[:user_id])
    property = user.properties.create!(property_params)
    property.save 
    redirect_to "/users/#{user.id}"
    
  end 


  private

  def property_params
    params.require(:property).permit(:name, :street, :city, :state, :zip_code, :phone_number)
  end 
end