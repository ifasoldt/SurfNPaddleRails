class PostsController < ApplicationController

  def index
  end

  def show
    if params[:id]
      @post = Post.find(params[:id].to_i)
    else
      @post = Post.all.sort_by{|post| post.created_at}.first
    end
    @posts = Post.all.sort_by{|post| post.created_at} - [@post]
  end
end
