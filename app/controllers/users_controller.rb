class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @songs = Song.where user_id: :id
    @mixes = current_user.mixes
  end

  def show
    @mixes = Mix.all
    @user = User.find(params[:id])
    @songs = Song.where user_id: :id
  end

  def index
    @mixes = Mix.all
    @users = User.all
  end

  private

  def song_params
    params.require(:song).permit(:title, :author, :user_id)
  end

end
