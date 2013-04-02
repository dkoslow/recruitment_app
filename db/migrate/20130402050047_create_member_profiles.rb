class CreateMemberProfiles < ActiveRecord::Migration
  def change
    create_table :member_profiles do |t|
      t.string :password_digest

      t.timestamps
    end
  end
end
