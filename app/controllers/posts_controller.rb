class PostsController < ApplicationController

  def index
    @posts = Post.eager_load(:author).order(created_at: :desc).all.to_a
    @featured = @posts.shift
  end
end
