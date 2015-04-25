require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  test "should get home" do
    get :root
    assert_response :success
  end

end
