# == Schema Information
#
# Table name: ghosts
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Ghost do
  
  before { @ghost = Ghost.new }
  before { @user = @ghost.user.build_association(email: "user@example.com") }

  subject { @ghost }

  it { should be_valid}

  it { should respond_to(:user) }

  specify { @ghost.user.should == @user }
  specify { @user.profile.should == @ghost }
end
