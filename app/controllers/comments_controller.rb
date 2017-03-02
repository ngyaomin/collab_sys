class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  def show
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_param)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comments_param
    params.require(:comment).permit(:user_id, :content, :post_id)
  end

end
