class AddVehicleToSale < ActiveRecord::Migration[5.0]
  def change
    add_reference :sales, :vehicle, foreign_key: true
  end
end
