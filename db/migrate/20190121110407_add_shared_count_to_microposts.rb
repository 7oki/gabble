class AddSharedCountToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :shares_count, :integer, :null => false, :default => 0
  end
end
