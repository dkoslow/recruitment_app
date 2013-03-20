# == Schema Information
#
# Table name: relationships
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  contact_id    :integer
#  interest_tags :text
#  notes         :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Relationship < ActiveRecord::Base
  attr_accessible :contact_id, :interest_tags, :notes

  belongs_to :user
  belongs_to :contact, class_name: "User"

  validates :user_id, presence: true
  validates :contact_id, presence: true

end
