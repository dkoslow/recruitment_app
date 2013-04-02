# == Schema Information
#
# Table name: member_profiles
#
#  id              :integer          not null, primary key
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class MemberProfile < ActiveRecord::Base
  attr_accessible :password, :password_confirmation,

  has_one :user, as: :profile, dependent: :destroy

  validates :email, presence: true,
  validates :password, presence: true,
  validates :password_confirmation, presence: true,
  validates_confirmation_of :password
end
