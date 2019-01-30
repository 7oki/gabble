class Account < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :reason, presence: true
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  private

end
