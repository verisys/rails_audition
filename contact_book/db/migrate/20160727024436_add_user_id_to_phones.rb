class AddUserIdToPhones < ActiveRecord::Migration[5.0]
  def change
    add_column :phones, :user_id, :integer, null: true
  end
end
