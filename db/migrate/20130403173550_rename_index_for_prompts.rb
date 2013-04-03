class RenameIndexForPrompts < ActiveRecord::Migration
  def change
    remove_index :prompts, :name => "index_prompts_on_user_id"
    add_index    :prompts, :member_id
  end
end
