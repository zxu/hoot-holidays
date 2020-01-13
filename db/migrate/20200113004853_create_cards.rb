class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_type
      t.string :card_number
      t.string :holder_name
      t.date :expiry_date
      t.string :ccv

      t.timestamps
    end
  end
end
