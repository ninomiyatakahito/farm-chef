class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:update, :create, :edit, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new

    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    unless current_user.id == @post.user.id
      redirect_to action: :index 
    end 
  end

  def update
    if post = Post.find(params[:id])
      post.update(post_params)
      redirect_to post_path (post.id), method: :get
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def home
    @posts = Post.all
  end


  private

  def post_params
    params.require(:post).permit(:post_text, :image).merge(user_id: current_user.id)
  end
end

