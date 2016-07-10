class Post < ActiveRecord::Base

  belongs_to :author
  belongs_to :category
  has_many :comments, dependent: :destroy  #追加

  # イイネ対策
  # 記事は複数のイイネを持つ
  has_many :likes

  #5件降順で表示
  scope :find_newest_article, -> { order(created_at: :desc).limit(5) }

  #入力制限
  validates :category_id, presence: :true
  validates :body, presence: :true, length: { maximum: 140}
end
