class Api::UsersController < ApplicationController
  # before_filter :authenticate_user!

  protect_from_forgery	
  respond_to :json

  # GET /api/users
  def index
	 render :json => User.all.as_json
	end

  # GET /api/users/show/:id
  def show
  	if !user = User.find_by_id(params[:id])
      render :json => {:status => "false", :error => "No user found with id: #{params[:id]}"}
    else
      render :json => user.as_json
    end
  end

end
