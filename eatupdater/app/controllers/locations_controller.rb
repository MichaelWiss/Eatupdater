class LocationsController < ApplicationController
     
require 'yelp'
  def index
      @locations = Location.all
  end 

 def show
      @location = Location.find(params[:id])
      respond_with @location
   end

  respond_to :js, :json, :html
   def create
   	    @location = Location.new(location_params[:lat, :long])
        respond_to do |format|
            if @location.save
                
                render json: { status: 'success' }
            else
                render json: { status: 'failure' }
            end 
        end

  




  private
    def location_params
      params.permit(:lat, :long)
    end
end

end
