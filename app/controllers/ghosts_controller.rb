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
    @user = @ghost.build_user(company: company, current_location:current_location,
                              first_name: first_name, last_name: last_name,
                              phone_number: phone_number, school: school)
    if @ghost.save
      @user.save
    end
  end

  def edit
  end

  def update
    @ghost = current_member.ghosts.find_by_id(params[:id])
    if @ghost.update_attributes(params[:member])
      @ghost.user.update_attributes(company: @member.company, current_location: @member.current_location,
                                     first_name: @member.first_name, last_name: @member.last_name,
                                     phone_number: @member.phone_number, school: @member.school)
      redirect_to current_member
    else
      render 'edit'
    end
  end

  def destroy
    @ghost.destroy
    redirect_to current_member
  end
end