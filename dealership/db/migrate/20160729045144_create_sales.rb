class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.references :user, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.decimal :price, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
