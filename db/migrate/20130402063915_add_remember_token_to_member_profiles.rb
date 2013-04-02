class AddRememberTokenToMemberProfiles < ActiveRecord::Migration
  def change
    add_column :member_profiles, :remember_token, :string
    add_index  :member_profiles, :remember_token
  end
end
