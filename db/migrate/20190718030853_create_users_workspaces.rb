class CreateUsersWorkspaces < ActiveRecord::Migration[5.2]
  def change
    create_table :users_workspaces do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :workspace, foreign_key: true

      t.timestamps
    end
  end
end
