class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.integer :location_id
      t.string :year
      t.string :make
      t.string :model
      t.decimal :price
      t.boolean :sold, default: false
      t.decimal :sale_price

      t.timestamps
    end
  end
end
