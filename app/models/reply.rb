class Reply < ApplicationRecord
  belongs_to :tweet, counter_cache: :replies_count
  belongs_to :user

end
