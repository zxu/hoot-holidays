class CreateScheduledFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_flights do |t|
      t.integer :carrier_id
      t.string :flight_no
      t.integer :from_airport_id
      t.integer :to_airport_id
      t.time :etd
      t.time :eta
      t.string :aircraft_type

      t.timestamps
    end
  end
end
