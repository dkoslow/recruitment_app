class AddInterestTagsAndNotesToGhosts < ActiveRecord::Migration
  def change
    add_column :ghosts, :interest_tags, :text
    add_column :ghosts, :notes, :text
  end
end
