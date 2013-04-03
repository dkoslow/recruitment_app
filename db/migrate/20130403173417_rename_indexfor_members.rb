class RenameIndexforMembers < ActiveRecord::Migration
  def change
    remove_index :members, :name => "index_member_profiles_on_remember_token"
    add_index    :members, :remember_token
  end
end
