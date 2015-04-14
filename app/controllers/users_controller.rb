class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @songs = current_user.songs
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end

end
