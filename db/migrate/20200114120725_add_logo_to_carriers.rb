class AddLogoToCarriers < ActiveRecord::Migration[5.2]
  def change
    add_column :carriers, :logo, :string
  end
end
