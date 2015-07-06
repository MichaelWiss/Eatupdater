class LocationsController < ApplicationController
   respond_to :js, :json, :html
   def create
   	    @location = Location.new(location_params)

        @location = Location.new(location_params)

        respond_to do |format|
            if @location.save
                format.html { redirect_to @location, notice: 'User was successfully created.' }
                format.json { render json: @location, status: :created, location: @product }
            else
                format.html { render action: "new" }
            end 
        end
    end

   def show
  	@location = Location.find(params[:id])
  	respond_with @location
   end


    private
  def location_params
    params.require(:location).permit(:lat, :long)
  end



end
