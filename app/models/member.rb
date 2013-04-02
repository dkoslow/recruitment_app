# == Schema Information
#
# Table name: member_profiles
#
#  id              :integer          not null, primary key
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Member < ActiveRecord::Base
  attr_accessible :password, :password_confirmation
  has_secure_password

  has_one :user, as: :profile, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :contacts, through: :relationships
  has_many :prompts, dependent: :destroy
  has_many :ghosts, dependent: :destroy

  validates :email, presence: true,
  validates :password, presence: true,
  validates :password_confirmation, presence: true

  before_save { email.downcase! }
  before_save :create_remember_token

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
