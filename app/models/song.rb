class Song < ActiveRecord::Base
  belongs_to :user

  def combine_songs(*args)
    args.each do |song|
      f = File.open(song, 'rb')
      # @s = f.read
      binding.pry
     end
    # output = @s.write(args.each)
    # puts output.inspect
  end 

end
