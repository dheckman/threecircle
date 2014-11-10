class VenuesController < ApplicationController
<<<<<<< HEAD
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
=======
  respond_to :html, :json, :js

  def index
  end

  def search
    term = params[:search]
    @venues = []
    Venue.clear_cached_venues
    $foursquare.search_venues(term).each do |search_venue|
      venue = Venue.from_search_venue(search_venue)
      Venue.cache_venue(venue)
      @venues << venue
    end
>>>>>>> a4e7cac6dac0da02a103a1f96995aa9175a034d7
  end
end
