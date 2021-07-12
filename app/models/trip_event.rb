class TripEvent < ApplicationRecord
  belongs_to :trip
  validates :yelp_event_id, uniqueness: true
  
  def event
    response = HTTP.auth("#{Rails.application.credentials.my_api_key}").get("https://api.yelp.com/v3/events/#{yelp_event_id}")
    event = response.parse(:json)
    display_address = event["location"]["display_address"] || nil
    event_cost = event["cost"]
    lat = event["latitude"]
    lng = event["longitude"]
    return {
      id: event["id"],
      name: event["name"],
      image_url: event["image_url"],
      cost: event_cost,
      ticket_link: event["tickets_url"],
      event_link: event["event_site_url"],
      description: event["description"],
      location: display_address,
      coordinates: [lat, lng,],
    }
  end

  def current
    ::Time.zone ? ::Time.zone.now.to_datetime : ::Time.now.to_datetime
  end
end