class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :comments , dependent: :destroy
         
         has_one_attached :avatar  #ユーザーのアバター

         has_many :likes, dependent: :destroy　#いいね機能 記述はあとで消す
         has_many :liked_posts, through: :likes, source: :post　#いいね機能
end
