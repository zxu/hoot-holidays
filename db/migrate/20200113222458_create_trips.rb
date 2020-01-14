class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.date :dep_date
      t.integer :scheduled_flight_id
      t.integer :passenger_id

      t.timestamps
    end
  end
end
