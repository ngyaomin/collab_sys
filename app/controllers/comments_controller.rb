class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => :index

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  def show
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
    @comment.user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_param)
    @comment.user = current_user

    @involved_users = []

    @post.comments.each do |comment|
      @involved_users << comment.user
    end

    @involved_users << @post.user
    @email_list = @involved_users.uniq

      if @comment.save

        @email_list.each do |user|
          if user.subscribe
            UserMailer.new_comments_email(user, @comment).deliver!
          end
        end

        redirect_to post_path(@post)
      else
        render 'new'
      end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comments_param)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comments_param
    params.require(:comment).permit(:user_id, :content, :post_id)
  end

end
