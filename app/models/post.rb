class Post < ActiveRecord::Base
  belongs_to :author
  validates :title, :body, :post_picture, presence: true
  validates :body, length: { minimum: 100}
  validates :title, length: { maximum: 100}
  validates :author_id, numericality: {only_integer: true}, allow_nil: true
end
