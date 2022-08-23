class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(user_id: 1)
    if @like.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user_id: 1)
    @like.destroy
    redirect_to root_path
  end
end