class LocationsController < ApplicationController
     

  def index
      @locations = Location.all
  end 



    




   def show
      @location = Location.find(params[:id])
      respond_with @location
   end

  respond_to :js, :json, :html
   def create
   	    @location = Location.new(location_params)
        respond_to do |format|
            if @location.save
                format.html { redirect_to @location, notice: 'location was successfully saved.' }
                format.json { render json: @location, status: :created, location: @location }
            else
                format.html { render action: "new" }
            end 
        end
  
   
 include Yelp::V2::Search::Request
   def search
     client = Yelp::Client.new

     request = location.new(
                 :term => 'thai',
                 :category_filter => 'food,restaurants',
                 :city=> params[:city],
                 :limit => 20,
                 :radius_filter => 8047,
                 :latitude => params[:lat],
                 :longitude => params[:long])
     response = client.search(request)
     render json: response

     # rest of your code
   end


  
   

   


  
  private
    def location_params
      params.require(:location).permit(:lat, :long, :name, :address,)
    end
end

end
