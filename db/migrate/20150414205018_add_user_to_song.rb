class AddUserToSong < ActiveRecord::Migration
  def change
    add_reference :songs, :user, index: true
    add_foreign_key :songs, :users
  end
end
