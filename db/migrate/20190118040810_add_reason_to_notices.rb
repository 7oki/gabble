class AddReasonToNotices < ActiveRecord::Migration[5.1]
  def change
    add_column :notices, :reason, :text
  end
end
