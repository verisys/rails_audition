class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :department, index: true
      t.string :name
      t.string :business_phone
      t.integer :business_extension
      t.string :home_phone
      t.string :emergency_contact_name
      t.string :emergency_contact_phone
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
