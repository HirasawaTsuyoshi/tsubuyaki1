class Comment < ActiveRecord::Base
  belongs_to :post
  scope :find_newest_comment, -> { order(created_at: :desc).limit(5) }

end
