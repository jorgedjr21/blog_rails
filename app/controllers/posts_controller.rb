class PostsController < ApplicationController
  before_action :set_post, only: :show
  def index
    @posts = Post.eager_load(:author).order(created_at: :desc).all.to_a
    @featured = @posts.shift
  end

  def show; end

  private


  def set_post
    @post = Post.eager_load(:author).find(params[:id])
  end
end
