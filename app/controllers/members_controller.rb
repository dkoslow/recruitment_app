class MembersController < ApplicationController

  before_filter :signed_in_member, only: [:index, :edit, :update, :destroy]
  before_filter :correct_member, only: [:edit, :update]

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
    @contacts = @member.contacts
    @ghosts = @member.ghosts
    @all_contacts = @contacts + @ghosts
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params[:member])
    @user = @member.build_user(company: @member.company, current_location: @member.current_location,
                               first_name: @member.first_name, last_name: @member.last_name,
                               phone_number: @member.phone_number, school: @member.school)
    if @member.save
      @user.save
      sign_in @member
      redirect_to @member
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end

  private

    def correct_member
      @member = Member.find(params[:id])
      redirect_to(root_url) unless current_member(@member)
    end
end
