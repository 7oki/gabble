class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :reason
      t.string :text
      t.string :picture

      t.timestamps
    end
  end
end
