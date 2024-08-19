class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 280 }
  
  has_many_attached :images

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :replies, dependent: :destroy
end
