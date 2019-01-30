class AddSharedIdToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :shared_id, :integer
  end
end
