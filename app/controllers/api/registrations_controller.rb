class Api::RegistrationsController < Devise::RegistrationsController

protect_from_forgery	
respond_to :json

	# POST /api/users
	def create
	# user = User.new(params[:api_user])
	user = User.new({:email=>params[:api_user][:email], :password=>params[:api_user][:password]})
	if user.save
		respond_to do |format|
			format.json{
				render :json => user.as_json
			}
			format.html{
				redirect_to new_api_user_session_path
			}
		end
	return
	else
		warden.custom_failure!
		render :json=> user.errors, :status=>422
	end
	end

	#GET /api/users/show
	def show
		if all_users = User.get_users
			render :json => all_users.as_json
		else
			render :json => {:status => "false" ,:error => "Unable to get users"}	
		end
	end

end 