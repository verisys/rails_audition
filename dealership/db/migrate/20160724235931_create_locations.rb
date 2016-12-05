class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address_line_1, null: false
      t.string :address_line_2
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false

      t.timestamps
    end
  end
end
