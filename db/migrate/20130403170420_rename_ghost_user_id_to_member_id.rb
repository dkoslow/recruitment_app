class RenameGhostUserIdToMemberId < ActiveRecord::Migration
  def change
    rename_column :ghosts, :user_id, :member_id
  end
end
