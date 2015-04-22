class Mix < ActiveRecord::Base
  belongs_to :user
  acts_as_likeable

  def is_checked?(id)
    songs.include?(id)
  end

end
