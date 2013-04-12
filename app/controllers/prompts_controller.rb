class PromptsController < ApplicationController

  before_filter :signed_in_member

  def index
    @prompts = current_member.prompts.order(:due_date)
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
      if params[:sync_with_google]
        redirect_to "/auth/google_oauth2"
      else
        flash[:success] = "Prompt created!"
        redirect_to prompts_path
      end
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
    @prompt = current_member.prompts.last
    @auth = request.env["omniauth.auth"]
    @token = @auth["credentials"]["token"]
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
    event = {
      'summary' => @prompt.title,
      'description' => @prompt.content,
      'location' => @prompt.location,
      'start' => {
        'dateTime' => @prompt.due_date,
      },
      'end' => {
        'dateTime' => @prompt.due_date,
      }
    }
    @result = client.execute(
      :api_method => service.events.insert,
      :parameters => {'calendarId' => @auth["info"]["email"]},
      :body => JSON.dump(event),
      :headers => {'Content-Type' => 'application/json'})
    flash[:success] = "Prompt created!"
    redirect_to prompts_path
  end
end