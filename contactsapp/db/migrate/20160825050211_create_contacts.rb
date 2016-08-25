class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :dept_name
      t.string :contact_name
      t.bigint :business_phone
      t.integer :extension
      t.bigint :home_phone
      t.string :emergency_contact_name
      t.bigint :emergency_contact_phone

      t.timestamps
    end
  end
end
