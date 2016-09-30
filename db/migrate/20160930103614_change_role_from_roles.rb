class ChangeRoleFromRoles < ActiveRecord::Migration[5.0]
  def change
    change_column :roles, :role, :integer, :default
  end
end
