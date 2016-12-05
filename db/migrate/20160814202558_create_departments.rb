class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.references :supervisor, references: :users, index: true

      t.timestamps
    end
  end
end
