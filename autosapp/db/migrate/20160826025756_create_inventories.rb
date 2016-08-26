class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.decimal :price, precision: 8, scale: 2
      t.string :location

      t.timestamps
    end
  end
end
