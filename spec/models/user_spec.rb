# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string(255)
#  last_name        :string(255)
#  phone_number     :string(255)
#  company          :string(255)
#  school           :string(255)
#  current_location :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  profile_id       :integer
#  profile_type     :string(255)
#

require 'spec_helper'

describe User do

  let(:member) { Member.create(email: "mem@example.com",
                               password: "secret",
                               password_confirmation: "secret",
                               email: "member@example.com",
                               company: "Warehouse Co.",
                               current_location: "New York",
                               first_name: "Michelle",
                               last_name: "Kwan",
                               phone_number: "400-400-4000",
                               school: "Stanford University") }

  before { @user = member.build_user(company: member.company,
                                     current_location: member.current_location,
                                     first_name: member.first_name, last_name: member.last_name,
                                     phone_number: member.phone_number, school: member.school) }

  subject { @user }

  it { should be_valid }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:company) }
  it { should respond_to(:school) }
  it { should respond_to(:current_location) }
  it { should respond_to(:profile) }
  it { should respond_to(:profile_id) }
  it { should respond_to(:profile_type) }

  describe "when profile_id is not present" do
    before { @user.profile_id = nil }
    it { should_not be_valid }
  end

  describe "when profile_type is not present" do
    before { @user.profile_type = nil }
    it { should_not be_valid }
  end

  it "should not allow access to prompt_id" do
    expect do
      User.new(profile_id: member.id)
    end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  end

  it "should not allow access to prompt_type" do
    expect do
      User.new(profile_type: member.class)
    end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  end
end