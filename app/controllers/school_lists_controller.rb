class SchoolListsController < ApplicationController
  def index
    render json: SchoolList.names_for(params[:term])
  end
end
