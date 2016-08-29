class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :business_phone
      t.string :extension
      t.string :home_phone
      t.string :department
      t.string :emergency_contact_name
      t.string :emergency_contact_number
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
