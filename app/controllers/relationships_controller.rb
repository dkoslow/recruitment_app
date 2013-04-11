class RelationshipsController < ApplicationController

  before_filter :signed_in_member

  def index
    @contacts = current_member.contacts
  end

  def create
    @contact = Member.find_by_id(params[:relationship][:contact_id])
    current_member.add_contact!(@contact)
    flash[:success] = "Contact added!"
    redirect_to @contact
  end

  def edit
    @relationship = Relationship.find_by_id(params[:id])
    @contact = @relationship.contact
  end

  def update
    @relationship = Relationship.find_by_id(params[:id])
    if @relationship.update_attributes(params[:relationship])
      flash[:success] = "Contact updated!"
      redirect_to @relationship.contact
    else
      render 'new'
    end
  end

  def destroy
    contact = Relationship.find_by_id(params[:id]).contact
    current_member.remove_contact!(contact)
    flash[:success] = "Contact removed."
    redirect_to contact
  end
end