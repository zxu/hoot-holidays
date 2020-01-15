class Airport < ApplicationRecord
  has_many :dep_flights, :class_name => 'ScheduledFlight', :foreign_key => 'from_airport_id'
  has_many :arr_flights, :class_name => 'ScheduledFlight', :foreign_key => 'to_airport_id'
end
