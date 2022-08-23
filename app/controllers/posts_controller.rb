class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    post = Post.new(post_params)
    post.user_id = 1
    if post.save
      redirect_to root_path
    else
      p post.errors.full_messages
      @posts = Post.all
      render :index
    end
  end

  def read
    post = Post.find(params[:id])
    post.read ? post.update(read: false) : post.update(read: true)
    respond_to do |format|
      format.json { render json: { status: 'ok' } }
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image, images: [])
  end

end
