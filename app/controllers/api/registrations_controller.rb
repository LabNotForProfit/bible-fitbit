class Api::RegistrationsController < Devise::RegistrationsController

  protect_from_forgery
  respond_to :json

  # POST /api/users
  def create
    user = User.new(sign_up_params)
    # user = User.new({:email=>params[:api_user][:email], :password=>params[:api_user][:password], :username => params[:api_user][:username]})
    if user.save
      respond_to do |format|
        format.json{
          render :json => user.as_json
        }
        format.html{
          redirect_to new_api_user_session_path
          # sign_up("user", resource)
          # respond_with resource, location: after_sign_up_path_for(resource)
        }
      end
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end

end
