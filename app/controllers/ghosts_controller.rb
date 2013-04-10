class GhostsController < ApplicationController

  before_filter :signed_in_member

  def index
    @ghosts = current_member.ghosts
  end

  def show
    @ghost = current_member.ghosts.find_by_id(params[:id])
  end

  def new
    @ghost = current_member.ghosts.build
  end

  def create
    @ghost = current_member.ghosts.build(params[:ghost])
    @user = @ghost.build_user(company: @ghost.company, current_location: @ghost.current_location,
                              first_name: @ghost.first_name, last_name: @ghost.last_name,
                              phone_number: @ghost.phone_number, school: @ghost.school)
    if @ghost.save
      @user.save
      flash[:success] = "Contact created!"
      redirect_to current_member
    else
      render 'new'
    end
  end

  def edit
    @ghost = current_member.ghosts.find_by_id(params[:id])
  end

  def update
    @ghost = current_member.ghosts.find_by_id(params[:id])
    if @ghost.update_attributes(params[:ghost])
      @ghost.user.update_attributes(company: @ghost.company, current_location: @ghost.current_location,
                                     first_name: @ghost.first_name, last_name: @ghost.last_name,
                                     phone_number: @ghost.phone_number, school: @ghost.school)
      flash[:success] = "Contact updated!"
      redirect_to current_member
    else
      render 'edit'
    end
  end

  def destroy
    @ghost = current_member.ghosts.find_by_id(params[:id])
    @ghost.destroy
    flash[:success] = "Contact destroyed."
    redirect_to current_member
  end
end