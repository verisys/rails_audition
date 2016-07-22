class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :dept_name
      t.string :contact_name
      t.string :business_phone
      t.string :business_extension
      t.string :home_phone
      t.string :emergency_contact
      t.string :emergency_phone
      t.boolean :active

      t.timestamps
    end
  end
end
