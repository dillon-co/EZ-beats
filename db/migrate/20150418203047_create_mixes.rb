class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
      t.string :name
      t.text :songs, array: true, default: []

      t.timestamps null: false
    end
  end
end