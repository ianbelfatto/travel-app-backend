class User < ApplicationRecord
  has_many :trips
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
