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
#  location   :string(255)
#

class Prompt < ActiveRecord::Base
  attr_accessible :company, :content, :due_date, :title, :location

  belongs_to :member

  validates_presence_of :member_id, :title
end
