class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  validates :content, length: {maximum: 140 }
  validates :user_id, presence: true
  validates :from_id, presence: true
  validates :type,    presence: true
  self.inheritance_column = :_type_disabled # typeを使用可能にする
end
