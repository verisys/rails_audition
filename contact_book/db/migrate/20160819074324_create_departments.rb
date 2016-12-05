class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.references :supervisor, index: true, unique: true

      t.timestamps null: false
    end
  end
end

