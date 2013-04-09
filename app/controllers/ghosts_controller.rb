class GhostsController < ApplicationController

  before_filter :signed_in_member

  def create
    @ghost = current_member.ghosts.build(params[:ghost])
    @user = @ghost.build_user(company: company, current_location:current_location,
                              first_name: first_name, last_name: last_name,
                              phone_number: phone_number, school: school)
    if @ghost.save
      @user.save
    end
  end

  def destroy
    @ghost.destroy
  end
end