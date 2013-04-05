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

require 'spec_helper'

describe Prompt do
  
  let (:member) { Member.create( email: "member@example.com", password: "secret",
                             password_confirmation: "secret") }
  before do
    @prompt = Prompt.new(title: "Prompt Title", content: "Submit resume.")
  end

  subject { @prompt }

  it { should respond_to(:member_id) }
  it { should respond_to(:company) }
  it { should respond_to(:content) }
  it { should respond_to(:due_date) }
  it { should respond_to(:title) }

  describe "when title is not present" do
    before { @prompt.title = nil }
    it { should_not be_valid }
  end

  describe "when user id is not present" do
    before { @prompt.member_id = nil }
    it { should_not be_valid }
  end

  it "should not allow access to user_id" do
    expect do
      Prompt.new(member_id: member.id)
    end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  end
end
