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
#  password_digest  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation,
                  :company, :current_location, :first_name,
                  :last_name, :phone_number, :school

  has_secure_password

  before_save { email.downcase! }

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
