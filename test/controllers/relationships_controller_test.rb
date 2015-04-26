require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @other_user = users(:two)
  end

  test "create should require logged-in user" do
    assert_no_difference 'Relationship.count' do
      post :create
    end
    assert_redirected_to user_session_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'Relationship.count' do
      delete :destroy, id: relationships(:one)
    end
    assert_redirected_to user_session_url
  end
end
