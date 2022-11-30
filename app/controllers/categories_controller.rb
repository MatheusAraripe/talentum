class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @users = User.where(category: @category)
    # @posts = Post.where(category: @category)
  end

end
