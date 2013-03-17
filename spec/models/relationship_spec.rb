require 'spec_helper'

describe Relationship do 

  let(:user) { User.create( email: "user@example.com", password: "secret",
                             password_confirmation: "secret") }

  let(:contact) { User.create( email: "contact@example.com", password: "secret",
                             password_confirmation: "secret") }

  let(:relationship) { user.relationships.build(contact_id: contact.id) }

  subject { relationship }

  it { should be_valid }

  describe "relationship methods" do
    it { should respond_to(:user) }
    it { should respond_to(:contact) }
    its(:user) { should == user }
    its(:contact) { should == contact }
  end

  describe "accessible attributes" do
    it "should not be able to access user_id" do
      expect do
        Relationship.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
