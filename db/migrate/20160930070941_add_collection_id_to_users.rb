class AddCollectionIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :collection_id, :integer
  end
end
