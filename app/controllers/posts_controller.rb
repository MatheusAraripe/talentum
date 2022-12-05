class PostsController < ApplicationController

  # before_action :set_user, only: %i[new create]
  skip_before_action :authenticate_user!, only: [ :show ]

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    authorize @post
  end

  private

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  # end

  def post_params
    params.require(:post).permit(:title, :description, :category_id, :photo)
  end
end
