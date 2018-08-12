class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
    #@posts = Post.all.includes(:comments) <-- had this originally not sure why
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
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post was successfully updated!"
      redirect_to @post
    else
      flash[:error] = 'Post was not updated.'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Post was successfully deleted!"
  end

  def downvote
    #@post = Post.find(params[:id])
    #@comment = @post.comments.find(params[:id])
    #@comment.downvote_from current_user
    #redirect_to @post
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :category)
    end

end
