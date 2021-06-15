require "http"
class BusinessesController < ApplicationController
  def index
    response = HTTP.get("https://api.yelp.com/v3/businesses/search?term=bar, vegan&location=106 Maiden Lane&radius=1609")
    render json: response.as_json
  end
end
