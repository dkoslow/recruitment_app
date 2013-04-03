class FixIndexForUsers < ActiveRecord::Migration
  def change
    remove_index :users, :profile_id
    remove_index :users, :profile_type
    add_index    :users, [:profile_id, :profile_type]
  end
end
