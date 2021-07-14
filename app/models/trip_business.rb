class TripBusiness < ApplicationRecord
  belongs_to :trip
  # validates :yelp_business_id, uniqueness: true
  
  def business
    # logic to query third party api for the correct business
    # get back object or hash of business data
    response = HTTP.auth("#{Rails.application.credentials.my_api_key}").get("https://api.yelp.com/v3/businesses/#{yelp_business_id}")
    business = response.parse(:json)
    # return business
    display_address = business["location"]["display_address"] || nil
    lat = business["coordinates"]["latitude"]
    lng = business["coordinates"]["longitude"]
    return {
      id: business["id"],
      name: business["name"],
      image_url: business["image_url"],
      open: !business["hours"],
      phone: business["phone"],
      location: display_address,
      coordinates: [lat, lng,],
      rating: business["rating"],
      review_count: business["review_count"],
      cost: business["price"],
      business_link: business["url"]

    }
  end
end
