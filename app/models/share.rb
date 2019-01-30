class Share < ApplicationRecord
  belongs_to :micropost
  counter_culture :micropost
  
  validates :user_id, presence: true, :uniqueness => {:scope => :micropost_id}
  validates :micropost_id, {presence: true}
end
