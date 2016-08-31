class AddSalemanUserIdToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :salesman_user_id, :integer
  end
end
