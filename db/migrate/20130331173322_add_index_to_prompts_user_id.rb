class AddIndexToPromptsUserId < ActiveRecord::Migration
  def change
    add_index :prompts, :user_id
  end
end
