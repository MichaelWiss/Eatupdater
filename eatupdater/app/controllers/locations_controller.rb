class LocationsController < ApplicationController
 respond_to :js, :json, :html
 require 'yelp'

  def index
      @locations = Location.all
  end 

  def show
      @location = Location.find(params[:id])
      respond_with @location
  end

  
  def create

   	    @location = Location.new(location_params)
        respond_to do |format|
            if @location.save
                redirect_to @user, notice: "Thanks for signing up!"
            else
                render :new
  end

  private

  def location_params
      location_params.require(:location).permit(:lat, :long)
  end
end

