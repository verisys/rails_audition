class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :position, index: true
      t.string :name
      t.string :username
      t.string :password
      t.integer :position_id

      t.timestamps null: false
    end
  end
end
