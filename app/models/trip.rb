class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_businesses
  validates :name, presence: true
end
