class Tweet < ApplicationRecord
  has_many :replies
  has_many :likes
  has_many :likers, through: :likes, source: :user
  belongs_to :user
  validates_presence_of :description

  def is_liked?(user)
    self.likers.include?(user)
  end
end
