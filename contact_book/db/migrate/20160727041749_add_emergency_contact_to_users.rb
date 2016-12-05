class AddEmergencyContactToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :contact_name, :string, null: true
    add_column :users, :contact_number, :string, null: true
  end
end
