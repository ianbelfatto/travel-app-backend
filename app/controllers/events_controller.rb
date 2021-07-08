class EventsController < ApplicationController
  before_action :authenticate_user
  def index
    response = HTTP.auth("#{Rails.application.credentials.my_api_key}").get("https://api.yelp.com/v3/events?location=#{params[:location].gsub(" ", "")}&limit=25")
    api_event_index = response.parse(:json)["events"]
    render json: api_event_index
  end

  def show
    response = HTTP.auth("#{Rails.application.credentials.my_api_key}").get("https://api.yelp.com/v3/events/#{params[:yelp_event_id]}")
    api_event_object = response.parse(:json) 
    render json: {
      id: api_event_object["id"],
      name: api_event_object["name"],
      image_url: api_event_object["image_url"],
      location: api_event_object["location"]["display_address"],
      lat: api_event_object["latitude"],
      lng: api_event_object["longitude"],

    }
  end
end
