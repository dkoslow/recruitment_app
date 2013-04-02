# == Schema Information
#
# Table name: members
#
#  id              :integer          not null, primary key
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#

class Member < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  attr_accessor :email

  has_secure_password

  has_one :user, as: :profile, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :contacts, through: :relationships
  has_many :prompts, dependent: :destroy
  has_many :ghosts, dependent: :destroy

  validates_presence_of :email, :password, :password_confirmation

  before_save :create_remember_token

  def add_contact!(contact)
    relationships.create!(contact_id: contact.id)
  end

  def remove_contact!(contact)
    relationships.find_by_contact_id(contact.id).destroy
  end

  def has_contact?(contact)
    relationships.find_by_contact_id(contact.id)
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
