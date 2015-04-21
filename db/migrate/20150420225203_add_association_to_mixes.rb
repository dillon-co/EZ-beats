class AddAssociationToMixes < ActiveRecord::Migration
  def change
    add_reference :mixes, :user, index: true
    add_foreign_key :mixes, :users
  end
end
