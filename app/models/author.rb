class Author < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true
  validates :name, length: { maximum: 35 }
end
