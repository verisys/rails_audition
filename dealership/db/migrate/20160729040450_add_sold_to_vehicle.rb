class AddSoldToVehicle < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :sold, :boolean, default: false
  end
end
