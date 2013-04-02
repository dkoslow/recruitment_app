class RemoveMemberFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password_digest
    remove_column :users, :ghost_user
    remove_column :users, :salt
    remove_column :users, :remember_token
  end

  def down
    add_column :users, :remember_token, :string
    add_column :users, :salt, :string
    add_column :users, :ghost_user, :string
    add_column :users, :password_digest, :string
  end
end
