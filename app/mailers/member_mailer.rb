class MemberMailer < ActionMailer::Base
  default from: "tapconnect@example.com"

  def signup_confirmation(member)
    @member = member
    mail to: member.email
  end
end
