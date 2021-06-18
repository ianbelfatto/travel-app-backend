class TripBusiness < ApplicationRecord
  belongs_to :trip
  
  def business
    # logic to query third party api for the correct book
    # get back object or hash of book data
    response = HTTP.auth("#{Rails.application.credentials.my_api_key}").get("https://api.yelp.com/v3/businesses/#{yelp_business_id}")
    api_business_object = response.parse(:json)
    return api_business_object
  #   return {
  #     id: business["id"],
  #     image_url: business["image_url"],
  #     open: business["is_closed?"],
  #     phone: business["phone"],
  #     location: business["location"]["display_address"]
  #   }
  end
end
