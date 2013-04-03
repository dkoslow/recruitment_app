# == Schema Information
#
# Table name: ghosts
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ghost < ActiveRecord::Base
  attr_accessible

  has_one :user, as: :profile, dependent: :destroy
  belongs_to :member
end
