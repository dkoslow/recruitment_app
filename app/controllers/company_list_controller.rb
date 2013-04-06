class CompanyListController < ApplicationController
  def index
    render json: CompanyList.names_for(params[:term])
  end
end
