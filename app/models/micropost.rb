class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  scope :search_by_keyword, -> (keyword) {
    where("microposts.content LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%") if keyword.present?
  }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size
  validate  :share
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
  
  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
    
    # 1つのツイートを複数回RTしない(連打するとできる為)
    def share
      if !shared_id.nil?
        
      end
    end
end