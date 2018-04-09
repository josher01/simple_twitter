class Followship < ApplicationRecord
  belongs_to :user,counter_cache: :follower_count
  belongs_to :following, class_name: "User"
  validates :following_id, uniqueness: {scope: :user_id}
end
