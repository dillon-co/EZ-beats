class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @song = Song.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end
