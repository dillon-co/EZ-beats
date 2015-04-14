require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get userinterface" do
    get :userinterface
    assert_response :success
  end

end
