class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :dept
      t.string :name
      t.string :business_phone
      t.string :business_ext
      t.string :home_phone
      t.string :emergency_contact
      t.string :emergency_number
      t.boolean :is_active

      t.timestamps
    end
  end
end
