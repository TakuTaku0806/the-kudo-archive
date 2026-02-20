class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create]
	before_action :set_post

	def create
		@comment = @post.comments.build(comment_params)
		@comment.user = current_user
		if @comment,save
			redurect_to @post, notice: "Comment added."
			else
				redirect_to @post, notice: "Comment could not be added."
			end
		end
		
		private

		def set_post
			@post = post.find(params[:post_id])
		end
		
		def comment_params
			params.require(:comment).permit(:content)
		end
	end
end					