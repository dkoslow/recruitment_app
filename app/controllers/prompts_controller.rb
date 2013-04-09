class PromptsController < ApplicationController

  before_filter :signed_in_member

  def index
    @prompts = current_member.prompts
  end

end