class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    #create_table :airports, :id => false do |t|
    create_table :airports do |t|
      #t.integer :id, :options => 'PRIMARY KEY'
      t.string :name
      t.string :city
      t.string :country
      t.string :iata_code
      t.string :icao_code
      t.string :latitude
      t.string :longitude
      t.string :region

      t.timestamps
    end
  end
end
