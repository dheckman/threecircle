require 'httparty'

class HomeController < ApplicationController

    def index
      if logged_in?
        fs_auth = current_user.authorizations.find_by(provider: :foursquare)

      end
    end

    def venues_search
      if params[:name]
        @venues = foursquare.venues.search(:ll => "40.7236307,-73.9999479")
      end
    end

end