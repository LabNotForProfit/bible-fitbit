class Api::AdminController < ApplicationController

  def manage_users
  	@users = User.all
  end

  def change_settings
  end
end
