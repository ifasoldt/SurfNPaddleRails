class PostsController < ApplicationController

  def show
    @ad = Ad.all.sample
    if params[:id]
      @post = Post.find(params[:id].to_i)
    else
      @post = Post.all.sort_by{|post| post.created_at}.first
    end
    @posts = Post.all.sort_by{|post| post.created_at} - [@post]
  end

  def search
    @posts = Post.all.sort_by{|post| post.created_at} - [Post.all.last]
    @post = Post.all.sort_by{|post| post.created_at}.first
    @ad = Ad.all.sample
    @searched_posts = Post.all.select do |post|
      (post.title.include?(params[:search_term])) ||
      (post.body.include?(params[:search_term])) ||
      (post.author.include?(params[:search_term]))
    end
    if @searched_posts[0]
      @search_message = "Here are the posts that match your search terms:"
    else
      @search_message = "I'm sorry, we were not able to find a match for your search term"
    end
  end
end
