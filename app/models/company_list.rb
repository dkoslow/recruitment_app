# == Schema Information
#
# Table name: company_lists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  popularity :integer
#

class CompanyList < ActiveRecord::Base
  extend AutocompleteHelper
  
  attr_accessible :name, :popularity
end
