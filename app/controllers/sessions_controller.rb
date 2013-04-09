class SessionsController < ApplicationController

  def new
  end

  def create
    member = Member.find_by_email(params[:session][:email].downcase)
    if member && Member.authenticate(user.email, params[:session][:password])
      sign_in member
      redirect_to member
    else
      render 'new'
    end
  end

  def destroy
  end

  def google_auth
    @auth = request.env["omniauth.auth"]
    @token = @auth["credentials"]["token"]
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.calendar_list.list,
      :parameters => {},
      :headers => {'Content-Type' => 'application/json'})
  end
end
