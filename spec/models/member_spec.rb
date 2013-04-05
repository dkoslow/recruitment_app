# == Schema Information
#
# Table name: members
#
#  id              :integer          not null, primary key
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#  email           :string(255)
#

require 'spec_helper'

describe Member do

  before do
    @member = Member.new(email: "member@example.com",
                         password: "secret",
                         password_confirmation: "secret",
                         email: "member@example.com",
                         company: "Manufacturing Co.",
                         current_location: "Atlanta",
                         first_name: "Walt",
                         last_name: "Whitman",
                         phone_number: "400-400-4000",
                         school: "Duke University")
  end

  subject { @member }

  it { should be_valid }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:email) }
  it { should respond_to(:company) }
  it { should respond_to(:school) }
  it { should respond_to(:current_location) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:ghosts) }
  it { should respond_to(:relationships) }
  it { should respond_to(:contacts) }
  it { should respond_to(:user) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:prompts) }

  describe "when email is blank" do
    before { @member.email = " " }
    it { should_not be_valid }
  end

  describe "when email is a duplicate" do
    before do
      other_member = Member.new(email: "other_member@example.com",
                                   password: "secret",
                                   password_confirmation: "secret")
      @member.email = other_member.email
      other_member.save
    end
    it { should_not be_valid }
  end

  describe "when password is blank" do
    before { @member.password = " "}
    it { should_not be_valid }
  end

  describe "when password and password_confirmation do not match" do
    before { @member.password_confirmation = "not_secret" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @member.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "return user based on successful authentication" do
    before { @member.save }
    let(:found_member) { Member.find_by_email(@member.email) }

    describe "valid password" do
      it { should == found_member.authenticate("secret")}
    end

    describe "invalid password" do
      let(:member_with_invalid_password) { found_member.authenticate("invalid") }

      it { should_not == member_with_invalid_password }
      specify { member_with_invalid_password.should be_false }
    end
  end

  describe "user associations" do
    before do
      @user = @member.build_user(company: @member.company,
                                 current_location: @member.current_location,
                                 first_name: @member.first_name, last_name: @member.last_name,
                                 phone_number: @member.phone_number, school: @member.school)
      @member.save
      @user.save
    end

    describe "it should have the right user" do
      specify { @member.user.should == @user }
    end

    describe "user should have the right profile" do
      specify { @user.profile.should == @member }
    end
  end

  describe "managing contacts" do
    let(:contact) { Member.create( email: "contact@example.com", password: "secret",
                             password_confirmation: "secret") }
    before do
      @member.save
      @member.add_contact!(contact)
    end

    describe "add contact" do
      it { should have_contact(contact) }
      its(:contacts) { should include(contact) }
    end

    describe "remove contact" do
      before { @member.remove_contact!(contact) }
      it { should_not have_contact(contact) }
      its(:contacts) { should_not include(contact) }
      specify { contact.should_not be_nil}
    end
  end

  describe "managing ghosts" do
    before { @member.save }
    let(:ghost) { @member.ghosts.create(email: "ghost@example.com") }

    describe "add ghost" do
      it { should have_ghost(ghost) }
      its(:ghosts) { should include(ghost) }
    end

    describe "delete ghost" do
      before do
        @member.ghosts.find_by_id(ghost.id).destroy
        @member.ghosts.reload
      end
      it { should_not have_ghost(ghost) }
      its(:ghosts) { should_not include(ghost) }
      specify { @member.ghosts.find_by_id(ghost.id).should be_nil }
    end
  end
end
