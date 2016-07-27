class CreateEmergencyContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :emergency_contacts do |t|
      t.string :name
      t.string :number

      t.timestamps
    end
    add_index :emergency_contacts, :name
    add_index :emergency_contacts, :number
  end
end
