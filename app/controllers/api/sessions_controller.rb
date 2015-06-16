class Api::SessionsController < Devise::SessionsController
prepend_before_filter :require_no_authentication, :only => [:create ]
#include Devise::Controllers
before_filter :ensure_params_exist, :only => :create
 
respond_to :json

# GET /users/sign_in
def new
self.resource = resource_class.new(sign_in_params)
clean_up_passwords(resource)
respond_with(resource, serialize_options(resource))
end

# POST /users/sign_in
def create
#build_resource
resource = User.find_for_database_authentication(:email=>params[:api_user][:email])
return invalid_login_attempt unless resource
 
if resource.valid_password?(params[:api_user][:password])
sign_in("user", resource)
render :json=> {:success=>true, :email=>resource.email}
return
end
invalid_login_attempt
end

# def destroy
# #sign_out(resource_name)
# signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
# set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
# yield if block_given?
# respond_to_on_destroy
# end
 
protected
def ensure_params_exist
puts params
return unless params[:api_user].blank? #this is true for some reason thus I'm getting this error
render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
end
 
def invalid_login_attempt
warden.custom_failure!
render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
end
end 