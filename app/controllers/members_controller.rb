class MembersController < ApplicationController

   def create
    @member = Member.new(params[:member])
    @user = @member.build_user(company: company, current_location:current_location,
                               first_name: first_name, last_name: last_name,
                               phone_number: phone_number, school: school)
    if @member.save
      @user.save
    end
  end

  def destroy
    @member.destroy
  end
end
