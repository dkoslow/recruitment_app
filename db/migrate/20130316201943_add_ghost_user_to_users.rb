class AddGhostUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ghost_user, :boolean, default: false
  end
end
