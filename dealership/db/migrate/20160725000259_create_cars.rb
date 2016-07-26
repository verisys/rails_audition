class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :make, null: false
      t.string :model, null: false
      t.integer :price, null: false
      t.string :year
      t.integer :mileage
      t.boolean :sold, default: false
      t.integer :sale_price
      t.belongs_to :location, foreign_key: true
      t.integer :salesman_id, null: true

      t.timestamps
    end
  end
end
