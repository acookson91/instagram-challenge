class LikesController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @post.likes.create
    render json: {new_like_count: @post.likes.count}
  end
  
end
