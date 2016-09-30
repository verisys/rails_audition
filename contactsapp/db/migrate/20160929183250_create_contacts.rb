class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :business_phone
      t.integer :home_phone
      t.integer :extension
      t.integer :department_id
      t.string :em_contact_name
      t.integer :em_contact_num
      t.timestamps null: false
    end
  end
end
