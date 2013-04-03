class AddIndexToGhostMemberId < ActiveRecord::Migration
  def change
    add_index :ghosts, :member_id
  end
end
