class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && User.authenticate(user.email, params[:session][:password])
      sign_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
  end

end