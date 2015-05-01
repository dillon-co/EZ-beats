class Song < ActiveRecord::Base
  belongs_to :user
  has_many :mixes
  acts_as_likeable
  acts_as_mentionable

  def combine_mixes(*args)
    args.each do |song|
      f = File.open(song, 'rb')
      # @s = f.read
      # binding.pry
     end
    # output = @s.write(args.each)
    # puts output.inspect
  end

end
