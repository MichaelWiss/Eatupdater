class LocationsController < ApplicationController
 
 respond_to :js, :json, :html
  

  def index
       serialized_results = []
      @locations = Location.all
  end 

  def show
      @location = Location.find(params[:id])
      respond_with @location
  end

  def new
      @location = Location.new
  end







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

 def search
    parameters = { term: params[:term], limit: 16 }
    @response = Yelp.client.search(location_params, parameters)
    render 'locations/index'  
end 




private

  def location_params
      params.require(:location).permit(:lat, :long)
  end
end


