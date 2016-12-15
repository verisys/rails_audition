class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :vehicle_id
      t.integer :user_id
      t.float :price

      t.timestamps
    end
  end
end
