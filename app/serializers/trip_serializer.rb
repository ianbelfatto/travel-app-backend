class TripSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :city, :state, :image_url
  has_many :trip_businesses
  has_many :trip_events
end
