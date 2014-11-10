require 'httparty'

class HomeController < ApplicationController

    before_action :index

    def index
      if logged_in?
        response = HTTParty.get("https://api.foursquare.com/v2/venues/search?near=durham,nc&client_id=4N23RFF1XUH1AA3AWBJFRPVR1SSMZU4FDU3PW1ADP5HTXHF4&client_secret=YHWQ322EJ2D5NMLKX5PY0432ZOZJV4W2XTK1ZUT315EJEIFD&v=20140806")
        @v = JSON.parse(response.body)
        @venues = @v["response"]["venues"]
        @coordinates = []
        @venues.each do |venue|
            latitude = venue["location"]["lat"].to_f
            longitude =  venue["location"]["lng"].to_f
            @coordinates <<[latitude, longitude]
    end
end




end
end

