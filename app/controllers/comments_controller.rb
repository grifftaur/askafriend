class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post
    else
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

  def upvote
    @post = Post.find(params[:id])
    #@comment = @post.comments.find(params[:id])
    #@comment.upvote_from current_user
    @post.upvote_from current_user
    redirect_to @post
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_from current_user
    redirect_to @post
  end

private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :username)
  end

end
