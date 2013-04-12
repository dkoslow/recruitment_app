class PromptsController < ApplicationController

  before_filter :signed_in_member

  def index
    @prompts = current_member.prompts
  end

  def show
    @prompt = current_member.prompts.find_by_id(params[:id])
  end

  def new
    @prompt = current_member.prompts.build
  end

  def create
    @prompt = current_member.prompts.build(params[:prompt])
    if @prompt.save
      flash[:success] = "Prompt created!"
      redirect_to prompts_path
    else
      render 'new'
    end
  end

  def edit
    @prompt = current_member.prompts.find_by_id(params[:id])
  end

  def update
    @prompt = current_member.prompts.find_by_id(params[:id])
    if @prompt.update_attributes(params[:prompt])
      flash[:success] = "Prompt updated!"
      redirect_to prompts_path
    else
      render 'edit'
    end
  end

  def destroy
    @prompt = current_member.prompts.find_by_id(params[:id])
    @prompt.destroy
    redirect_to prompts_path
  end

  def google_auth
    @prompt = current_member.prompts.find_by_id(params[:id])
    @auth = request.env["omniauth.auth"]
    @token = @auth["credentials"]["token"]
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
    event = {
      'summary' => 'Appointment',
      'description' => 'Just a test.',
      'location' => 'Somewhere',
      'start' => {
        'dateTime' => '2013-04-16T10:00:00.000-07:00'
      },
      'end' => {
        'dateTime' => '2013-04-16T10:30:00.000-07:00'
      }
    }
    @result = client.execute(
      :api_method => service.events.insert,
      :parameters => {'calendarId' => @auth["info"]["email"]},
      :body => JSON.dump(event),
      :headers => {'Content-Type' => 'application/json'})
    print @result.data.id
  end
end