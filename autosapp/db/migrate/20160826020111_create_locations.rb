class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :location_name, null = 'false  '
      t.text :address
      t.string :state
      t.integer :phone_number
      t.integer :zip

      t.timestamps
    end
  end
end
