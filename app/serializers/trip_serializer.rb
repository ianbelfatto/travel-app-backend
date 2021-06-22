class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :state, :image_url
  has_many :trip_businesses
end
