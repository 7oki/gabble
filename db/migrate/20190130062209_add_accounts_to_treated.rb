class AddAccountsToTreated < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :treated, :boolean, default: false, null: false
  end
end
