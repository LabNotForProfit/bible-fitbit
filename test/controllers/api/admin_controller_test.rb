require 'test_helper'

class Api::AdminControllerTest < ActionController::TestCase
  test "should get manage_users" do
    get :manage_users
    assert_response :success
  end

end
