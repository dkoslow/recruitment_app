class RemoveIndexFromGhosts < ActiveRecord::Migration
  def change
    remove_index  :ghosts, :name => "index_ghost_profiles_on_user_id"
  end
end
