class Mix < ActiveRecord::Base
  belongs_to :user

  def is_checked?(id)
    songs.include?(id)
  end

  private

  def parse_songs
    params[:mix].values
  end

  def mix_params
    params.require(:mix).permit(:name)
  end

end
