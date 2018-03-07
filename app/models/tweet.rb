class Tweet < ApplicationRecord
  has_many :replies
  has_many :users, through: :replies
  belongs_to :user
end
