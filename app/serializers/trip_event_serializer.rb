class TripEventSerializer < ActiveModel::Serializer
  attributes :id, :comments
  belongs_to :event
end
