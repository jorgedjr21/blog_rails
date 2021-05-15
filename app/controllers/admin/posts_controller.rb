module Admin
  class PostsController < Admin::ApplicationController
    before_action :set_authors, only: :new

    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admin_posts_path, alert: 'Post created'
      else
        flash.now[:danger] = 'Oops, something went wrong!'
        render :new
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :description, :category, :author_id, :content)
    end

    def set_authors
      @authors = Author.all
    end
  end
end
