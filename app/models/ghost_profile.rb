# == Schema Information
#
# Table name: ghost_profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GhostProfile < ActiveRecord::Base
  attr_accessible

  has_one :user, as: :profile, dependent: :destroy
end
