class User < ApplicationRecord
  has_many :trips, optional: true
  has_secure_password
  validates :email, presence: true
end
