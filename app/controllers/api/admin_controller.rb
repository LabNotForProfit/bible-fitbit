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

  def make_admin
  	@user = User.find_by_id(params[:user_id])
  	@user.update_attribute :admin, true
  	redirect_to api_admin_manage_users_path
  end

  def render_admin_form
  	@user = User.find_by_username(params[:username])
  end

end
