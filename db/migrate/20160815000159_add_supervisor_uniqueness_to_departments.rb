class AddSupervisorUniquenessToDepartments < ActiveRecord::Migration
  def change
    change_column :departments, :supervisor_id, :integer, unique: true
  end
end
