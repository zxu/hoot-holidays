class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  validates :name, presence: true

  # Tell geocoder where to look to get the human-readable address string
  # which it will use to work out the lat/long coordinates
  geocoded_by :address

  # Tell geocoder to actually turn the above address into a latitude
  # and longitude (by doing a lookup in a remote API) any time
  # you create or update a User item
  after_validation :geocode
end
