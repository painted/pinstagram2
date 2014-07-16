class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :description, :image, :tag_names))
		@post.user = current_user
		@post.save!

		redirect_to posts_path
	end
end
