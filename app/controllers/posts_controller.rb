class PostsController < ApplicationController
	before_action :set_post, only: %i[show edit update destroy like]
	  before_action :authenticate_user!, except: [:index, :show]
	def index
		@post = Post.all.order("created_at DESC")
	end

	def new
		@post = Post.new
		@user = current_user
	end

	def show
		
		@comment = Comment.where(post_id: @post).order(created_at: :DESC)
		@user = User.find(@post.user_id)
		@total_like = LikePost.where(post_id: @post.id).count
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to post_path(@post)
		else
			render :new
		end

	end

	def edit

	end

	def update
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end


	def like

		LikePost.create(user_id: current_user.id, post_id: @post.id)
		redirect_to post_path(@post)
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:article, :description, :user_id)
	end
end
