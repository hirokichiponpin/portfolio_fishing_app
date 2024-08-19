class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @post.likes.create(user: current_user)
    redirect_to posts_path, notice: 'Liked the post.'
  end

  def destroy
    like = @post.likes.find(params[:id])
    like.destroy
    redirect_to posts_path, notice: 'Unliked the post.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
