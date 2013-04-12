class SessionsController < ApplicationController

  before_filter :signed_in_member, only: [:google_auth]

  def new
  end

  def create
    member = Member.find_by_email(params[:session][:email].downcase)
    if member && member.authenticate(params[:session][:password])
      sign_in member
      redirect_to member
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
