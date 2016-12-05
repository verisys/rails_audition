class AddActiveToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_active, :boolean, null: false, default: true
  end
end
