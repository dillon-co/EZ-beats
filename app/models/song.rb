class Song < ActiveRecord::Base
  belongs_to :user
  has_many :mixes
  acts_as_likeable
  acts_as_mentionable

  def combine_mixes(*args)
    song = []
    song<<args 
    return song
  end

end
