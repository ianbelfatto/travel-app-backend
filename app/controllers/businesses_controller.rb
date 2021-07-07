class BusinessesController < ApplicationController
  before_action :authenticate_user
  def index
    response = HTTP.auth("#{Rails.application.credentials.my_api_key}").get("https://api.yelp.com/v3/businesses/search?term=#{params[:terms].gsub(" ", "")}&location=#{params[:location].gsub(" ", "")}")
    api_business_index = response.parse(:json)["businesses"]
    render json: api_business_index
  end

  def show
    response = HTTP.auth("#{Rails.application.credentials.my_api_key}").get("https://api.yelp.com/v3/businesses/#{params[:yelp_business_id]}")
    api_business_object = response.parse(:json) 
    render json: {
      id: api_business_object["id"],
      name: api_business_object["name"],
      image_url: api_business_object["image_url"],
      # open: api_business_object["is_closed"],
      rating: api_business_object["rating"],
      phone: api_business_object["phone"],
      location: api_business_object["location"]["display_address"],
      lat: api_business_object["coordinates"]["latitude"],
      lng: api_business_object["coordinates"]["longitude"],
      hours: api_business_object["hours"][0]["open"]
    }
  end
end
