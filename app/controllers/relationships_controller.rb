class RelationshipsController < ApplicationController

  before_filter :signed_in_member

  def index
    @contacts = current_member.contacts
  end

  def create
    @contact = Member.find_by_id(params[:id])
    current_member.add_contact!(@contact)
    flash[:success] = "Contact added!"
    redirect_to @contact
  end

  def edit
    @contact = current_member.contacts.find_by_id(params[:id])
  end

  def update
    @contact = current_member.contacts.find_by_id(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:success] = "Contact updated!"
      redirect_to current_member
    else
      render 'new'
    end
  end

  def destroy
    @contact = Member.find_by_id(params[:id])
    current_member.remove_contact!(@contact)
    flash[:success] = "Contact removed."
    redirect_to current_member
  end
end