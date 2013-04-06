class SchoolListController < ApplicationController
  def index
    render json: SchoolList.names_for(params[:name])
  end
end
