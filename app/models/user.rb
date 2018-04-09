class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :tweets 
  has_many :replies , through: :tweets
  has_many :liked_tweets, through: :likes, source: :tweet
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user
  validates_presence_of :name, uniqueness: {scope: :user_id}

  def is_followings?(user)
    self.followings.include?(user)
  end
end
