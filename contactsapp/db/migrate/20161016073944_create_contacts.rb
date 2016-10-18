class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.references :department, foreign_key: true
      t.string :name
      t.string :business_phone
      t.string :home_phone
      t.string :emergency_contact_name
      t.string :emergency_contact_number

      t.timestamps
    end
  end
end
