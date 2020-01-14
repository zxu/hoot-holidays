class ScheduledFlight < ApplicationRecord
  belongs_to :carrier
  has_many :trip
end
