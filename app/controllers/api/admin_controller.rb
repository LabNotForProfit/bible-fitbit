class Api::AdminController < ApplicationController

  def manage_users
  	@users = User.all

  	respond_to do |format|
      format.json {
        render :json => @users.as_json(:only => [:id, :username, :firstname, :lastname, :email], :methods => [:avatar_url])
      }
      format.html {
        render 'manage_users'
      }
    end
  end

  def change_settings
  end
end
