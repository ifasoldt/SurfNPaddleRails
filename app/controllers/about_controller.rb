class AboutController < ApplicationController
  def index
    @ad = Ad.all.sample
    if params[:id]
      @post = Post.find(params[:id].to_i)
    else
      @post = Post.all.sort_by{|post| post.created_at}.first
      @post.id = 0
    end
    @posts = Post.all.sort_by{|post| post.created_at} - [@post]
  end
end
