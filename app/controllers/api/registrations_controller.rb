class Api::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters
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
          flash[:notice] = "Welcome to Bible Fitbit!"
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

   # GET /api/users/edit
  def edit
  	render :edit
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:username)
    devise_parameter_sanitizer.for(:sign_up).push(:lastname)
    devise_parameter_sanitizer.for(:sign_up).push(:firstname)
  end

end
