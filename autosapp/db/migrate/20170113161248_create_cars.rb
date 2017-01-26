class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.belongs_to :location, index: true
      
      t.string :make
      t.string :model
      t.float :price
      t.boolean :sold
      t.string :sold_by
      t.float :sold_price

      t.timestamps
    end
  end
end
