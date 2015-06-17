class Api::UsersController < ApplicationController
  # before_filter :authenticate_user!

  protect_from_forgery	
  respond_to :json

  # GET /api/users
  def index
	if all_users = User.get_users
			render :json => all_users.as_json
		else
			render :json => {:status => "false" ,:error => "Unable to get users"}	
		end
  end

  def show
	@user = User.find(params[:id])
	unless @user == current_user
	  redirect_to :back, :alert => "Access denied."
	end
  end

end