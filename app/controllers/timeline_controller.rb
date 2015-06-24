class TimelineController < ApplicationController

  # User must be logged in to access anything
  before_filter :authenticate_user!
  
  def index
  	@user = current_user
  end

  def edit
  	@user = current_user
  end

end
