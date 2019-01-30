class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
