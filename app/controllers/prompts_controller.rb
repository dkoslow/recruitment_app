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
end