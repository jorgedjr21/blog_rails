class PostsController < ApplicationController

  def index
    @posts = Post.eager_load(:author).all
  end
end
