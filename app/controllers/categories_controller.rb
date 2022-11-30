class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category: @category)
  end

end
