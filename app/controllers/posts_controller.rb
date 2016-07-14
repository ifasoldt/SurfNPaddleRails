class PostsController < ApplicationController
  before_action :pass_in_models

  def pass_in_models
    @posts = Post.order_posts_four(1)
    @ad = Ad.all.sample
  end

  def index
    @ordered_posts = Post.order_posts_all
    @ad = Ad.all.sample
  end

  def show
    @ad = Ad.all.sample
    @post = Post.set_post(params[:id])
    @posts = Post.order_posts_four(params[:id])
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

  def new
    #can't be Post.create else would sent to patch/update.
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      @post_errors = @post.errors.messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end



  private


  def post_params
    params.require(:post).permit(:author_id, :body, :title, :post_picture)
  end
end
