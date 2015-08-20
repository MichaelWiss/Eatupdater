class LocationsController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  attr_reader :location, :lat, :long

 
   respond_to :js, :json, :html
  



 




  

  def create
       @location = Location.new(location_params)
        respond_to do |format|
            if @location.save
                format.html {redirect_to @location, notice: 'location was saved'}
                format.json { render json: @location, status: :created, location: @location }
                format.js
            else
                format.html {render action: "new" }
                format.json {render json: @location.errors, status: :unprocessable_entity }
                format.js
            end
        end
  end

  def lat
    
  end

  def long
    
  end

   def show
      @location = Location.find(params[:id])
      respond_with @location
  end

  def new
      @location = Location.new
  end

  
  def index
      @latitude = Location.last.lat
      @longitude = Location.last.long
  end



  





private

  def location_params
      params.require(:location).permit(:lat, :long)
  end
end