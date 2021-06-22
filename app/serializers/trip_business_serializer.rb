class TripBusinessSerializer < ActiveModel::Serializer
  attributes :id, :comments
  belongs_to :business
end
