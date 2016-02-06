class PostsController < ApplicationController
	before_action :find_params, only: [:show, :edit, :update, :destroy]
	def index
		@posts = Post.all.order("created_at DESC")
	end
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to root_url
		else
			render 'new'
		end
	end
	def show
	end
	def edit
	end
	def update
		if @post.update(post_params)
			redirect_to root_url
		else
			render 'edit'
		end
	end
	def destroy
		@post.destroy
		redirect_to @post
	end
	private
	def post_params
		params.require(:post).permit(:title, :tag, :content)
	end
	def find_params
		@post = Post.find(params[:id])
	end
end
