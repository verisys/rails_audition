class AddPositionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :position, :string, default: 'Salesman'
  end
end
