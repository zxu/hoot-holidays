class AddIndexToScheduledFlights < ActiveRecord::Migration[5.2]
  def change
    add_index :scheduled_flights, :carrier_id
    add_index :scheduled_flights, :from_airport_id
    add_index :scheduled_flights, :to_airport_id
  end
end
