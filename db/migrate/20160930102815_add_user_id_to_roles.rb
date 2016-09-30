class AddUserIdToRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :user_id, :integer
  end
end
