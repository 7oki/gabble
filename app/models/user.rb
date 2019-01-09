class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 30 }
  validates :login_name, presence: true, length: { maximum: 30 }, uniqueness: true
  VALID_EMAIL_REGEX = /[\d]+[a-z]@ugs\.kochi-tech\.ac\.jp/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end