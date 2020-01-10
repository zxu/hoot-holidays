class CreateCarriers < ActiveRecord::Migration[5.2]
  def change
    create_table :carriers do |t|
      t.string :name
      t.string :iata_code
      t.string :alliance

      t.timestamps
    end
  end
end
