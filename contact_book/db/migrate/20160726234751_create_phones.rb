class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :type
      t.string :number

      t.timestamps
    end
    add_index :phones, :type
    add_index :phones, :number
  end
end
