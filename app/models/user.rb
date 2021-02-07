class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :comments , dependent: :destroy
         
         has_one_attached :avatar 

         has_many :likes, dependent:  :delete_all
         has_many :liked_posts, through: :likes, source: :post

         has_many :relationships
         has_many :followings, through: :relationships, source: :follow
         has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
         has_many :followers, through: :reverse_of_relationships, source: :user

         

  def already_liked?(post)                #ユーザーが投稿に対して、すでにいいねをしているのかどうかを判定
    self.likes.exists?(post_id: post.id)
  end
end

