class Trip < ApplicationRecord
  belongs_to :scheduled_flight
  belongs_to :passenger
end
