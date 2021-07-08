class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_businesses
  has_many :trip_events
  validates :name, presence: true
end
