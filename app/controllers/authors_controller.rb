class AuthorsController < ApplicationController
  before_action :pass_in_models

  def pass_in_models
    @posts = Post.order_posts_four(1)
    @ad = Ad.all.sample
  end

  def index
    @ordered_authors = Author.order_authors_all
  end

  def show
    @author = Author.set_author(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(@author.id)
    else
      @author_errors = @author.errors.messages
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to @author
    else
      render :edit
    end
  end

  def destroy
      @author = Author.find(params[:id])
      @author.destroy
      redirect_to authors_path
  end


  private

  def author_params
    params.require(:author).permit(:name, :picture)
  end
end
