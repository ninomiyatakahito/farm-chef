class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  has_many :likes

  validates :post_text, presence: true 
  validates :image, presence: true

end

