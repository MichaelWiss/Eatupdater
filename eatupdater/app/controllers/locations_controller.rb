class LocationsController < ApplicationController
  attr_reader :location
 
   respond_to :js, :json, :html
  



 

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

  

  # def to_s
  #   @location.latitude.to_s << ', ' << @location.longitude.to_s
  # end

  def index
      @latitude = Location.last.lat
      @longitude = Location.last.long
  end

  def search

  eating_places = Hash.new{|k, v| k[v] = {}}

params = { term: 'Hmong',
           category_filter: 'restaurants'
         }

locale = { cc: "US", lang: 'en' }

coordinates = { latitude: @latitude.to_s , longitude: @longitude.to_s }
 
Yelp.client.search_by_coordinates( coordinates, params, locale).businesses.each do |place|
  eating_places[place.name] = {
    :review_count => place.review_count,
    :rating => place.rating,
    :categories => place.categories,
  }
end 

end





private

  def location_params
      params.require(:location).permit(:lat, :long)
  end
end