class Mix < ActiveRecord::Base
  belongs_to :user

  def is_checked?(id)
    songs.include?(id)
  end
  
end