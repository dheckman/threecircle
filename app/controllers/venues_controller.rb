class VenuesController < ApplicationController
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
  end
end
