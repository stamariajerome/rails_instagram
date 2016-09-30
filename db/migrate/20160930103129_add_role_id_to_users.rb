class AddRoleIdToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :roles, :user_id
    add_column :users, :role_id, :integer, :default => 1
  end
end
