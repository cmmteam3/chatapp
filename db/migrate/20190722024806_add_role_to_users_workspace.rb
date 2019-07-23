class AddRoleToUsersWorkspace < ActiveRecord::Migration[5.2]
  def change
    add_column :users_workspaces, :role, :string
  end
end
