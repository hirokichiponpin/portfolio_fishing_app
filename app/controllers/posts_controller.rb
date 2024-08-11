class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def new
    @post = Post.new
  end

	def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

	def post_params
    params.require(:post).permit(:content, images: [])
  end
end
