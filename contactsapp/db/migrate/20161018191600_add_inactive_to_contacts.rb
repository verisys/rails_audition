class AddInactiveToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :active, :boolean, default: true
  end
end
