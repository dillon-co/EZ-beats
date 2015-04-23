class SongsController < ApplicationController
before_action :authenticate_user!

  def index
    @user = current_user
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "Song Saved"
      redirect_to songs_path
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
    if current_user.id != @song.user_id
      flash[:danger] = "You are not authorized to edit this project."
      redirect_to songs_path
    end

  end

  def update
    if current_user.id == @song.user_id
      if @song.update(song_params)
        flash[:success] = "Updated '#{@project.name}'"
        redirect_to songs_path
      else
        flash[:danger] = "Please make sure everything is filled in."
        render :edit
      end
    else
      flash[:danger] = "You are don't have permission to edit this song."
      redirect_to @song
    end
  end

def destroy
  @song = Song.find(params[:id])
    if current_user.id == @song.user_id
      @song.destroy
      flash[:success] = "Song deleted."
      redirect_to songs_path
    else
      redirect_to @song
    end
  end


  private

  def song_params
    params.require(:song).permit(:title, :author, :user_id)
  end

end
