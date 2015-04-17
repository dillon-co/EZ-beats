require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include Warden::Test::Helpers

  def setup
    @user = users(:one)
    @other_user = users(:two)
    @song = songs(:one)
    @other_song = songs(:two)
    @new_params = { title: "Updated", author: "This is updated"}
    sign_in @user
  end

  test "should create song" do
		assert_difference('Song.count', 1) do
			post :create, user: @user, song: { :title => 'Test', :author => 'Test Author'}
		end
		assert_redirected_to songs_path
	end

  test "should delete song" do
		post :create, song: { :title => 'Test', :author => 'Test author' ,
														 :user_id => @user.id }
		song = assigns(:song)
		assert_difference('Song.count', -1) do
			delete :destroy, id: song.id
		end
		assert_redirected_to songs_path
	end

  test "test should edit song" do
		post :create, song: { :title => 'Test', :author => 'Test author' ,
														 :user_id => @user.id }
		song = assigns(:song)
		get :edit, id: song.id
		assert_response :success
		assert_template :edit
	end

  test "Creating a song should assign it to the current user" do
    current_user = @user
    post :create, song: { :title => 'Test', :author => 'Test author' ,
                             :user_id => current_user.id }
    song = assigns(:song)
    assert_equal current_user.id, song.user.id
  end

  test "Song can only be edited by the creator" do
		post :create, song: { :title => 'Test', :author => 'Test author' ,
  													 :user_id => @user.id }
  	song = assigns(:song)
  	get :edit, id: song.id
  	assert_response :success
		assert_template :edit
		sign_out @user
		sign_in @other_user
		get :edit, id: song.id
		patch :update, id: @song.id, song: @new_params
		updated_song = assigns(:song)
		assert_not_equal updated_song.title, @new_params[:title]
  	assert_redirected_to song
	end

  test "Song can not be deleted by other user" do
		post :create, song: { :title => 'Test', :author => 'Test author' ,
  													 :user_id => @user.id }
  	song = assigns(:song)
  	sign_out @user
  	sign_in @other_user
 		assert_no_difference('Song.count') do
			delete :destroy, id: song.id
		end
		assert_redirected_to song
	end
end
