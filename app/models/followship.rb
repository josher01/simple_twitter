class Followship < ApplicationRecord
  belongs_to :user
  belongs_to :following, class_name: "User",counter_cache: :follower_count
  validates :following_id, uniqueness: {scope: :user_id}
end
