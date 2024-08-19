class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build(reply_params.merge(user: current_user))

    if @reply.save
      redirect_to posts_path, notice: 'Reply was successfully created.'
    else
      redirect_to posts_path, alert: 'Failed to create reply.'
    end
  end

  def destroy
    if @reply.destroy
      redirect_to posts_path, notice: 'Reply was successfully deleted.'
    else
      redirect_to posts_path, alert: 'Failed to delete reply.'
    end
  end

  private

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:content)
  end
end
