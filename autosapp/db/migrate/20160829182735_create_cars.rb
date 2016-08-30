class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :price
      t.integer :sell_price
      t.boolean :sold
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
