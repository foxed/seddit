class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = 0
    if @post.save
      flash[:notice] = "Your post has been saved!"
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
