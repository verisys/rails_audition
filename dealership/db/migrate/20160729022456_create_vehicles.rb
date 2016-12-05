class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.float :list_price
      t.references :location, foreign_key: true

      t.timestamps
    end
    add_index :vehicles, :make
    add_index :vehicles, :model
  end
end
