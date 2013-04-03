class RenameUserIdForRelationships < ActiveRecord::Migration
  def change
    rename_column :relationships, :user_id, :member_id
    remove_index  :relationships, :name => "index_relationships_on_user_id"
    add_index     :relationships, :member_id
  end
end
