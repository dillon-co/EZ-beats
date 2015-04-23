class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @mixes = current_user.mixes
    @activities = PublicActivity::Activity.all
  end

  def show
    @mixes = Mix.all
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity.all
  end

  def index
    @users = User.all
  end

end
