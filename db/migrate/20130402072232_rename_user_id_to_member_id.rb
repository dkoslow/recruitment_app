class RenameUserIdToMemberId < ActiveRecord::Migration
  def change
    rename_column :prompts, :user_id, :member_id
  end
end
