class PagesController < ApplicationController

  def home
  end

  def about
  end

  def contact
  end

  def mobile
  end

  def help
  end

  def google_news
    @term = params[:term]
  end
end
