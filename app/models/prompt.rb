# == Schema Information
#
# Table name: prompts
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  company    :string(255)
#  due_date   :datetime
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Prompt < ActiveRecord::Base
  attr_accessible :email, :company, :content, :due_date, :title

  belongs_to :member

  validates_presence_of :member_id, :title
end
