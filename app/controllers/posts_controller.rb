class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  # def upvote
  #   @post = Post.find(params[:id])
  #   @post.liked_by current_user
  #   redirect_to posts_path
  # end

  # def downvote
  #   @post = Post.find(params[:id])
  #   @post.downvote_from current_user
  #   redirect_to posts_path
  # end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      User.find_each do |user|
        if user.subscribe
          UserMailer.notification_email(user, @post).deliver!
        end
      end
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @involved_users = []

    @post.comments.each do |comment|
      @involved_users << comment.user
    end

    @involved_users << @post.user
    @email_list = @involved_users.uniq

    if @post.update(post_params)
      @email_list.each do |user|
        if user.subscribe
          UserMailer.changes_email(user, @post).deliver!
        end
      end
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :topic)
    end


end
