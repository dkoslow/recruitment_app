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
                  :last_name, :phone_number, :school, :ghost_user

  attr_accessor :password

  before_save { email.downcase! }
  before_save :encrypt_password, :unless => Proc.new { |user| user.ghost_user == true }

  validates :email, presence: true,
            :unless => Proc.new { |user| user.ghost_user == true }
  validates :password, presence: true,
            :unless => Proc.new { |user| user.ghost_user == true }
  validates :password_confirmation, presence: true,
            :unless => Proc.new { |user| user.ghost_user == true }
  validates_confirmation_of :password,
            :unless => Proc.new { |user| user.ghost_user == true }

  def self.authenticate(email, password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.correct_password?(password)
  end

  def correct_password?(submitted_password)
    password_digest == encrypt(submitted_password)
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.password_digest = encrypt(password)
  end

  def encrypt(password)
    secure_hash("#{salt}--#{password}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
