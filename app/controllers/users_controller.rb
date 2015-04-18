class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @songs = current_user.songs
    @activities = PublicActivity::Activity.all
  end

  def show
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity.all
  end

  def index
    @users = User.all
  end

end
