class AddIndexToUsersLoginName < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :login_name, unique: true
  end
end
