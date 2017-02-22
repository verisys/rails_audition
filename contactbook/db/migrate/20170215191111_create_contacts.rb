class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :department
      t.string :name
      t.string :business_phone
      t.string :extension
      t.string :home_phone
      t.string :emergency_contact_name
      t.string :emergency_contact_phone
      t.boolean :active,                    default: true

      t.timestamps
    end
  end
end
