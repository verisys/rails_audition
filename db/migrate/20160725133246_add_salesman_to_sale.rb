class AddSalesmanToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :salesman, :reference
  end
end
