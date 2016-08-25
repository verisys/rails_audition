class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :dept_name, null:false
      t.string :contact_name, null:false
      t.bigint :business_phone, null:false
      t.int :extension
      t.bigint :home_phone, null:false
      t.string :emergency_contact_name, null:false
      t.bigint :emergency_contact_phone, null:false

      t.timestamps
    end
  end
end
