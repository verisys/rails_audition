class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.references :location, foreign_key: true
      t.integer :salesman_id, foreign_key: true
      t.string :make, null: false
      t.string :model, null: false
      t.integer :year, null: false
      t.decimal :price, :precision => 10, :scale => 2, null: false
      t.integer :mpg_city
      t.integer :mpg_hwy
      t.string :color, null: false
      t.integer :stock, null: false
      t.string :vin, null: false
      t.string :image_url
      t.boolean :sold, default: false
      t.integer :sell_price, default: 0, null: false
      t.text :sell_notes

      t.timestamps
    end
  end
end
