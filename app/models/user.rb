# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string(255)
#  last_name        :string(255)
#  phone_number     :string(255)
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
end
