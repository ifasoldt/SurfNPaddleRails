class AboutController < ApplicationController
  def index
    @ad = Ad.all.sample
    @posts = Post.order_posts_four
  end
end
