class AddNoticesToTreated < ActiveRecord::Migration[5.1]
  def change
    add_column :notices, :treated, :boolean, default: false, null: false
  end
end
