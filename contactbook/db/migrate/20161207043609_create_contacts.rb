class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
    	t.belongs_to :department, index: true
    	t.string :name
    	t.string :business_phone
    	t.string :business_extension
    	t.string :home_phone
    	t.string :emergency_contact_name
    	t.string :emergency_contact_phone
        t.boolean :inactive, default: false, null: false
    	t.timestamps
    end
    add_index :contacts, [:business_extension, :business_phone], unique: true
  end
end
