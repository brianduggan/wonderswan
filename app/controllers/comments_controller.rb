class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @user = current_user
    @blog = Blog.find(params[:blog_id])
  end

  def create
    comment = Comment.create(comment_params)
    redirect_to root_path
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :blog_id, :body, :author)
  end

end
