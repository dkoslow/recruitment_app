# == Schema Information
#
# Table name: members
#
#  id              :integer          not null, primary key
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#

require 'spec_helper'

describe Member do
  pending "add some examples to (or delete) #{__FILE__}"
end
