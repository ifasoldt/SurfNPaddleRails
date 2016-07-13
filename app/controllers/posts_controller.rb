class PostsController < ApplicationController

  def show
    @ad = Ad.all.sample
    @post = Post.set_post(params[:id])
    @posts = Post.order_posts(params[:id])
  end

  def search
    @posts = Post.all.sort_by{|post| post.created_at} - [Post.all.last]
    @post = Post.all.sort_by{|post| post.created_at}.first
    @ad = Ad.all.sample
    @searched_posts = Post.searched_posts(params[:search_term])
    if @searched_posts[0]
      @search_message = "Here are the posts that match your search terms:"
    else
      @search_message = "I'm sorry, we were not able to find a match for your search term"
    end
  end
end
