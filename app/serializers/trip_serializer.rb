class TripSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :city, :state, :image_url, :trip_businesses
end
