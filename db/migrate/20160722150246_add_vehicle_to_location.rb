class AddVehicleToLocation < ActiveRecord::Migration[5.0]
  def change
    add_reference :vehicles, :location, foreign_key: true
  end
end
