class CommentsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new
		@user = current_user
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		if @comment.save
			redirect_to post_path(@post)
		else
			render :new
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:comment_description, :user_id)
	end
end
