# == Schema Information
#
# Table name: ghosts
#
#  id            :integer          not null, primary key
#  member_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  email         :string(255)
#  interest_tags :text
#  notes         :text
#

class Ghost < ActiveRecord::Base
  attr_accessible :email, :company, :current_location, :first_name,
                  :last_name, :phone_number, :school

  attr_accessor :company, :current_location, :first_name,
                :last_name, :phone_number, :school

  has_one :user, as: :profile, dependent: :destroy

  belongs_to :member

  validates :member_id, presence: true
end
