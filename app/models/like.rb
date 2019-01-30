class Like < ActiveRecord::Base
  belongs_to :micropost
  counter_culture :micropost
  belongs_to :user
  validates :user_id, presence: true, :uniqueness => {:scope => :micropost_id}
  validates :micropost_id, {presence: true}
end