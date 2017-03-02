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

    if @post.update(post_params)
      # cccUser.all.each do |user|
      #   if user.subscribe
      #     UserMailer.changes_email(user, @post).deliver!
      #   end
      # end
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
