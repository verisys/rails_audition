class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address, default: 'To Be Determined'

      t.timestamps
    end
    add_index :locations, :address
  end
end
