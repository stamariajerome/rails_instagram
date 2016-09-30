class ChangeTableRoles < ActiveRecord::Migration[5.0]
  def change
    change_table :roles do |t|
      t.remove :role, :default => 'user'
      t.string :role
    end
  end
end
