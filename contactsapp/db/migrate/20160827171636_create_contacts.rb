class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :department_id
      t.string :name
      t.string :business_phone_number
      t.string :business_phone_extension
      t.string :home_phone_number
      t.string :emergency_contact
      t.string :emergency_contact_phone_number

      t.timestamps
    end
  end
end
