class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :user_id
      t.decimal :sale_price
      t.references :vehicle
      
      t.timestamps null: false
    end
  end
end
