require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include Warden::Test::Helpers
  Warden.test_mode!

  def setup
    @user = users(:one)
    @other_user = users(:two)
  end

  test 'profile redirect when not signed in' do
    get :profile
    assert_response 302 # new_user_session_path
    # assert_template :root # new_user_session_path
  end


  test "should get profile when signed in" do
    sign_in :user, @user
    get :profile
    assert_response :success
  end

  test "should get show" do
    sign_in @user
    user = @other_user
    get :show, id: user.id
    assert_response :success
  end

  test "should get index when signed in" do
    # get :index
    # assert_redirected_to new_user_session_path
    sign_in :user, @user
    get :index
    assert_response :success
  end

  def teardown
    Warden.test_reset!
  end
end
