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
  	if user = User.get_user(params[:id])
  		render :json => user.as_json
  	else
  		render :json => {:status => "false", :error => "No user found with id: #{params[:id]}"}
  	end
  end

end