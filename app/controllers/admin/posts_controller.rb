module Admin
  class PostsController < Admin::ApplicationController
    before_action :set_post, only: %i[edit update destroy]

    def index
      @posts = Post.eager_load(:author).all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admin_posts_path, success: 'Post created'
      else
        flash.now[:danger] = 'Oops, something went wrong!'
        render :new
      end
    end

    def edit; end

    def update
      if @post.update(post_params)
        redirect_to admin_posts_path, success: 'Post updated!'
      else
        flash.now[:danger] = 'Oops, something went wrong!'
        render :edit
      end
    end

    def destroy
      if @post.destroy
        flash[:success] = 'Post deleted!'
      else
        flash[:danger] = "Error while deleting post, please try again: #{@post.destroy}"
      end

      redirect_to admin_posts_path
    end

    private

    def post_params
      params.require(:post).permit(:title, :description, :category, :author_id, :content)
    end

    def set_post
      @post = Post.find(params[:id])
    end
  end
end
