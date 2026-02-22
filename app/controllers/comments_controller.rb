class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    
    # Fixed: changed comma to dot in @comment.save
    if @comment.save
      # Fixed: corrected redurect_to to redirect_to
      redirect_to @post, notice: "Comment added."
    else
      redirect_to @post, alert: "Comment could not be added."
    end
  end
  
  private

  def set_post
    # Fixed: changed post.find to Post.find
    @post = Post.find(params[:post_id])
  end
  
  def comment_params
    # Note: Ensure your database column is :content (or change to :body if needed)
    params.require(:comment).permit(:content)
  end
end