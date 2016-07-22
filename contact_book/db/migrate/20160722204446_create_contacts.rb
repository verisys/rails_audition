class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :business_phone
      t.integer :extension
      t.integer :home_phone
      t.string :emergency_contact_name
      t.integer :emergency_contact_phone
      t.belongs_to :department, foreign_key: true

      t.timestamps
    end
  end
end
