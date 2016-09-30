class ChangeTableUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :role_id
      t.integer :role_id, :default => 1
    end
  end
end
