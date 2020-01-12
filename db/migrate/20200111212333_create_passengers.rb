class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.text :name
      t.text :email
      t.date :dob
      t.text :phone
      t.text :passport_no
      t.text :passport_country

      t.timestamps
    end
  end
end
