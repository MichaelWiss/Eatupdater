class LocationsController < ApplicationController
 respond_to :js, :json, :html

  def new
    @location = Location.new
  end

  def index
      @locations = Location.all
  end 

  def show
      @location = Location.find(location_params[:id])
      respond_with @location
  end

  def create
            @location = Location.new(location_params)
            respond_to do |format|
            if @location.save
                format.html {redirect_to root_url, :notice => "Signed up!"}
            else
                format.html {render :new}
            end
  end

private

  def location_params
      params.require(:location).permit(:lat, :long, :id)
  end
end
end


