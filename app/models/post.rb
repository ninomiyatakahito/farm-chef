class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  has_many :likes　　#いいね機能
  has_many :liked_users, through: :likes, source: :user　　#同上

  validates :post_text, presence: true
  validates :image, presence: true
end
