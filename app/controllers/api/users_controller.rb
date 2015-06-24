class Api::UsersController < ApplicationController
  # before_filter :authenticate_user!

  protect_from_forgery
  respond_to :json

  # GET /api/users
  def index
    @users = User.all

    respond_to do |format|
      format.json {
        render :json => @users.as_json
      }
      format.html {
        render 'index'
      }
    end

  end

  # GET /api/users/show/:id
  def show
    # change to User.friendly.find to use the friendly username param
    @user = User.friendly.find(params[:id])

    respond_to do |format|
      format.json {
        if @user.nil?
          render :json => {:status => "false", :error => "No user found with id: #{params[:id]}"}
        else
          render :json => @user.as_json
        end
      }
      format.html {
        render 'show'
      }
    end
  end
end
