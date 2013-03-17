class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  end

  def edit
  end

  def update
  end

  def contacts
    @user = User.find(params[:id])
    @contacts = @user.contacts
  end
end
