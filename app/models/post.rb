class Post < ActiveRecord::Base
  belongs_to :author
  validates :title, :body, :post_picture, presence: true
  validates :body, length: { minimum: 100}
  validates :title, length: { maximum: 100}
  validates :author_id, numericality: {only_integer: true}, allow_nil: true

  def self.order_posts(params)
    #is the ordering happening before the taking?
    @ordered_posts = Post.order(created_at: :desc).where.not("id = ?", params).take(4)
  end

  def self.set_post(params)
    @post = Post.find_by! id: params.to_i
  end

  def self.searched_posts(params)
    @searched_posts = Post.where("body LIKE ? OR title LIKE ? OR author LIKE ?", "%#{params}%", "%#{params}%", "%#{params}%")
  end

end
