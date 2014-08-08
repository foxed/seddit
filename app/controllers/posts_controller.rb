class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create(post_params)
    if post.valid?
      flash[:notice] = "Your post has been saved!"
    else
      flash[:error] = "Your post has invalid credentials."
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
