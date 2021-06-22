class BusinessesController < ApplicationController
  before_action :authenticate_user
  def index
    response = HTTP.auth("#{Rails.application.credentials.my_api_key}").get("https://api.yelp.com/v3/businesses/search?term=#{params[:terms]}&location=#{params[:location]}")
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
      open: api_business_object["is_closed"],
      rating: api_business_object["rating"],
      phone: api_business_object["phone"],
      location: api_business_object["location"]["display_address"]
    }
  end
end
