class CreateCarDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :car_details do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.text :engine
      t.string :color

      t.timestamps
    end
  end
end
