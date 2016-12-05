class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :sale_price

      t.timestamps
    end
  end
end
