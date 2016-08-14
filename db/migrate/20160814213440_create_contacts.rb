class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :department, index: true
      t.string :name
      t.string :business_phone
      t.string :home_phone
      t.string :emergency_contact_name
      t.string :emergency_contact_phone

      t.timestamps
    end
  end
end
