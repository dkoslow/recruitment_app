class RenameMemberProfilesToMembers < ActiveRecord::Migration
  def change
    rename_table :member_profiles, :members
  end
end
