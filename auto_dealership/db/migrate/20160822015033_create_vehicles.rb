class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.references :location, index: true
      t.references :user, index: true
      t.integer :year
      t.string :make
      t.string :model
      t.string :vin
      t.string :price
      t.integer :milage
      t.string :ext_color
      t.string :int_color
      t.integer :locationid
      t.boolean :available, default: true
      t.string :sold_price
      t.integer :userid

      t.timestamps null: false
    end
  end
end
