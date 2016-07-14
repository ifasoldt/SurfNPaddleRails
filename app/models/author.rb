class Author < ActiveRecord::Base
  has_many :posts
  validates :name, :picture, presence: true

  def self.set_author(params)
    @author = Author.find_by! id: params
  end

  def self.order_authors_all
    @ordered_authors = Author.order(created_at: :desc)
  end
end
