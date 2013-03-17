# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string(255)
#  last_name        :string(255)
#  phone_number     :string(255)
#  email            :string(255)
#  company          :string(255)
#  school           :string(255)
#  current_location :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  password_digest  :string(255)
#

require 'spec_helper'

describe User do
  
  before { @user = User.new( email: "user@example.com", password: "secret",
                             password_confirmation: "secret") }

  subject { @user }

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
  it { should respond_to(:ghost_user) }

  describe "when email is blank" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when password is blank" do
    before { @user.password = " "}
    it { should_not be_valid }
  end

  describe "when password and password_confirmation do not match" do
    before { @user.password_confirmation = "not_secret" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "return user based on successful authentication" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "valid password" do
      example { found_user.should == User.authenticate("user@example.com", "secret")}
    end

    describe "invalid password" do
      let(:user_with_invalid_password) { User.authenticate(found_user.email, "invalid") }

      example { found_user.should_not == user_with_invalid_password }
      specify { user_with_invalid_password.should be_nil }
    end
  end
end
