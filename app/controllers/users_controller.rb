class UsersController < ApplicationController
  
  before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @user = User.find(params[:id])
    ghost_contacts = @user.contacts.select { |user| user.ghost_user? }
    @users = User.where(:ghost_user => false) + ghost_contacts
  end

  def show
    @user = User.find(params[:id])
    if @user.ghost_user?
      redirect_to current_user unless current_user.relationship_owner?(@user)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user != current_user
      current_user.add_contact!(@user)
      redirect_to current_user
    else
      sign_in @user
      redirect_to @user
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      if @user != current_user
        redirect_to current_user
      else
        sign_in @user
        redirect_to @user
      end
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to current_user
  end

  def contacts
    @user = User.find(params[:id])
    @contacts = @user.contacts
  end

  private

    def signed_in_user
      redirect_to new_session_path unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to @user unless current_user?(@user) || current_user.relationship_owner?(@user)
    end

end
