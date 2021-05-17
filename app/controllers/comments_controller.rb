class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = Comment.all
    @comment = @post.comments.build
  end

  def new
    @comment = @post.comments.build
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comments_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_comments_path(post_id: @comment.post_id), notice: "Tweet was successfully created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@comment, partial: 'comments/form', locals: { comment: @comment })  }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:name, :content, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
