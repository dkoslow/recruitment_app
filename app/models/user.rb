# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string(255)
#  last_name        :string(255)
#  phone_number     :string(255)
#  email            :string(255)
#  company          :string(255)
#  school           :string(255)
#  current_location :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  profile_id       :integer
#  profile_type     :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :company, :current_location, :first_name,
                  :last_name, :phone_number, :school

  belongs_to :profile, polymorphic: true

  has_many :relationships, dependent: :destroy
  has_many :contacts, through: :relationships
  has_many :prompts, dependent: :destroy

  before_save { email.downcase! }

  def add_contact!(contact)
    relationships.create!(contact_id: contact.id)
  end

  def remove_contact!(contact)
    if contact.ghost_user == true
      relationships.find_by_contact_id(contact.id).destroy
      contact.destroy
    else
      relationships.find_by_contact_id(contact.id).destroy
    end
  end

  def has_contact?(contact)
    relationships.find_by_contact_id(contact.id)
  end

  def relationship_owner?(user)
    current_user.has_contact?(user) && user.ghost_user?
  end
end
