class RenameGhostProfilesToGhosts < ActiveRecord::Migration
  def change
    rename_table :ghost_profiles, :ghosts
  end
end
