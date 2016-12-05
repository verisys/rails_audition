class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username, :null => false 
    	t.string :password, :null => false  #Yep, it's not encrypted for this demo
      t.string :role, :null => false      #We'd want a whole role schema here, but just this for now
      t.references :department

      t.timestamps null: false
    end
  end
end
