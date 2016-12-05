class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.integer :business_phone, null: false
      t.integer :extension, null: false
      t.integer :home_phone, null: false
      t.string :emergency_contact_name, null: false
      t.integer :emergency_contact_phone, null: false
      t.boolean :active, null: false, default: true
      t.belongs_to :department, foreign_key: true

      t.timestamps
    end
  end
end
