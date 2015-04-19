class AddCheckedToMixes < ActiveRecord::Migration
  def change
    add_column :mixes, :checked, :boolean, default: false
  end
end
