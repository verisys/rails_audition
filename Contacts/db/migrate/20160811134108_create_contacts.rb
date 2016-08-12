class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :business_phone
      t.string :business_phone_ext
      t.string :home_phone
      t.string :emergency_contact_name
      t.string :emergency_contact_number
      t.boolean :active, :null => false, :default => true
      t.references :department

      t.timestamps
    end
    add_index :contacts, :department_id
  end
end
