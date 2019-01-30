class Notice < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :reason, presence: true
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  
  private


end
