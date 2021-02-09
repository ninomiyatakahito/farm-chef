class User < ApplicationRecord
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

        def follow(other_user)
          unless self == other_user
            self.relationships.find_or_create_by(follow_id: other_user.id)
          end
        end
    
        def unfollow(other_user)
          relationship = self.relationships.find_by(follow_id: other_user.id)
          relationship.destroy if relationship
        end
      
        def following?(other_user)
          self.followings.include?(other_user)
        end

  def already_liked?(post)                #ユーザーが投稿に対して、すでにいいねをしているのかどうかを判定
    self.likes.exists?(post_id: post.id)
  end
end

