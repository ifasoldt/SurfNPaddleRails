class Author < ActiveRecord::Base
  has_many :posts
  validates :name, :picture, presence: true
end
