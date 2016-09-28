class RemoveCollectionIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :collection_id
  end
end
