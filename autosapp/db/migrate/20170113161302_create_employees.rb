class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.belongs_to :location, index: true
      
      t.string :name
      t.string :role

      t.timestamps
    end
  end
end
