class CreateGhostProfiles < ActiveRecord::Migration
  def change
    create_table :ghost_profiles do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :ghost_profiles, :user_id
  end
end
