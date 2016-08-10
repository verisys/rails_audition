class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :dept
      t.string :business_phone
      t.string :business_phone_ext
      t.string :home_phone
      t.string :emerg_contact_name
      t.string :emerg_contact_number
      t.boolean :active
      t.timestamps
    end
  end
end
