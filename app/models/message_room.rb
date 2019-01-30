class MessageRoom < ApplicationRecord
  validates :user1_id, presence: true, :uniqueness => {:scope => :user2_id}
  validates :user2_id, presence: true
end
