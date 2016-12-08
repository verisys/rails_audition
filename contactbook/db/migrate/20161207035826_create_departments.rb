class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
  	create_table :supervisors do |t|
  		t.string :name
  		t.timestamps
  	end
    create_table :departments do |t|
    	t.belongs_to :supervisor, index: true
    	t.string :name
    	t.timestamps
    end
  end
end
