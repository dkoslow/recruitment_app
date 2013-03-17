class Relationship < ActiveRecord::Base
  attr_accessible :contact_id, :interest_tags, :notes

  belongs_to :user
  belongs_to :contact, class_name: "User"

  validates :user_id, presence: true
  validates :contact_id, presence: true

end
