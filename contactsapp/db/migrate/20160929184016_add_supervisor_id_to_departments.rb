class AddSupervisorIdToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :supervisor_id, :integer
  end
end
