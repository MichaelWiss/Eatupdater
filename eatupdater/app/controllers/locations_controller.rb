class LocationsController < ApplicationController
 respond_to :js, :json, :html

  def index
      @locations = Location.all
  end 

  def show
      @location = Location.find(params[:id])
      respond_with @location
  end

  def create
       @location = Location.new(location_params[:location])
        respond_to do |format|
            if @location.save
              puts "We’re in the IF statement"
                format.html {redirect_to @user, notice: "Thanks for signing up!"}
            else
             format.html {render :new}
            end
  end

private

  def location_params
      params.require(:location).permit(:lat, :long)
  end
end
end


