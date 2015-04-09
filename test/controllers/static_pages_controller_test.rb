require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get read" do
    get :read
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get userinterface" do
    get :userinterface
    assert_response :success
  end 

end
