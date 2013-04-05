# == Schema Information
#
# Table name: ghosts
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string(255)
#

require 'spec_helper'

describe Ghost do
  
  let(:member) { Member.create(email: "member@example.com",
                               password: "secret",
                               password_confirmation: "secret") }
  before do
    @ghost = member.ghosts.build(email: "ghost@example.com",
                                 company: "Company Co.",
                                 current_location: "Durham",
                                 first_name: "Emily",
                                 last_name: "Dickinson",
                                 phone_number: "800-800-8000",
                                 school: "Duke University")
  end

  subject { @ghost }

  it { should be_valid }

  it { should respond_to(:user) }
  it { should respond_to(:member_id)}

  describe "user associations" do
    before do
      @user = @ghost.build_user(company: @ghost.company,
                                current_location: @ghost.current_location,
                                first_name: @ghost.first_name, last_name: @ghost.last_name,
                                phone_number: @ghost.phone_number, school: @ghost.school)
      @ghost.save
      @user.save
    end

    describe "it should have the right user" do
      specify { @ghost.user.should == @user }
    end

    describe "user should have the right profile" do
      specify { @user.profile.should == @ghost }
    end
  end

  describe "member associations" do

    describe "it should have the right member" do
      specify { @ghost.member.should == member }
    end

    it "should not allow access to member_id" do
      expect do
        Ghost.new(member_id: member.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    describe "it should have a member" do
      before { @ghost.member = nil }
      it { should_not be_valid }
    end
  end
end
