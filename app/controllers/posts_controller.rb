class PostsController < ApplicationController
  #before_action :set_user, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  # end

  def post_params
    params.require(:post).permit(:title, :description, :category_id, :photo)
  end
end
