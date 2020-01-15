class ScheduledFlight < ApplicationRecord
  belongs_to :carrier
  has_many :trip

  belongs_to :from_airport, :class_name => 'Airport'
  belongs_to :to_airport, :class_name => 'Airport'
end
