class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.float :price
      t.integer :location_id
      t.string :mpg
      t.string :speed
      t.string :status
      t.string :color

      t.timestamps
    end
  end
end
