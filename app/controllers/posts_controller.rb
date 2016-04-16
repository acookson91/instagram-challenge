class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(posts_params)
    redirect_to '/posts'
  end

  def posts_params
    params.require(:post).permit(:caption)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(posts_params)
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted'
    redirect_to '/posts'
  end

end
