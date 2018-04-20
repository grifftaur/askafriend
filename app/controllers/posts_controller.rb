class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "New post successfully created."
      redirect_to root_path
    else
      flash[:success] = "Post was not created"
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, "Post was successfully updated!"
    else
      flash[:error] = "Post was not updated."
       render :edit
     end
  end

  def destroy
    @post.destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :category)
    end

  end
