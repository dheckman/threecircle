require 'httparty'

class HomeController < ApplicationController

    def index
      if logged_in?
        response = HTTParty.get("https://api.foursquare.com/v2/venues/search?near=NewYork&client_id=4N23RFF1XUH1AA3AWBJFRPVR1SSMZU4FDU3PW1ADP5HTXHF4&client_secret=YHWQ322EJ2D5NMLKX5PY0432ZOZJV4W2XTK1ZUT315EJEIFD&v=20140806")
        @v = JSON.parse(response.body)
        @venues = @v["response"]["venues"]

      end
    end

    def venues_search

        response = HTTParty.get("https://api.foursquare.com/v2/venues/search?near=NewYork&query&client_id=FOURSQUARE_KEY&client_secret=FOURSQUARE_SECRET")

        venue = JSON.parse(response.body)
        @places = venue["response"]["venues"]

    end



end