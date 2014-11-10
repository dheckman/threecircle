class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end

  def index
    @venue = Venue.all
  end

  def create
    response = HTTParty.get("https://api.foursquare.com/v2/venues/search?",
                             query: params[:name])
    all = JSON.parse(response.body)


    @venues = all["response"]["venue"]

  end

  private

  def venue_params
    params.require(:venue).permit(:address, :latitude, :longitude)
  end
end
