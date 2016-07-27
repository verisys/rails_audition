class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.references :manager, index: true
      t.belongs_to :department, index: true
      t.string :name
      t.string :business_phone
      t.string :extension
      t.string :home_phone
      t.string :emergency_contact
      t.string :emergency_phone
      t.boolean :active

      t.timestamps
    end
  end
end
