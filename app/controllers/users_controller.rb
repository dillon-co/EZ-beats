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
    @songs = Song.where user_id: :id
  end

  def index
    @users = User.all
  end

  private

  def song_params
    params.require(:song).permit(:title, :author, :user_id)
  end

end
