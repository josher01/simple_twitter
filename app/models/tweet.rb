class Tweet < ApplicationRecord

  belongs_to :user, counter_cache: :tweets_count
  has_many :replies
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  validates_presence_of :description

  def is_liked?(user)
    self.likers.include?(user)
  end
end
