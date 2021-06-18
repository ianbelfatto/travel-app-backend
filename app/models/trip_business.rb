class TripBusiness < ApplicationRecord
  belongs_to :trip
  
  def business
    # logic to query third party api for the correct book
    # get back object or hash of book data
    response = HTTP.auth("Bearer LKjWeyV15MlmLe-LSTDP1VSzKafBmcmas6K1trP8lD3R_BjSJ6rX1sIUE2zvUQetwPGhTmj-uwn07cOirGL0m5c9H7_HGiNIiWLtPFISDfUIf_jXR_ayykq_AhWtYHYx").get("https://api.yelp.com/v3/businesses/#{yelp_business_id}")
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
