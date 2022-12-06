class CategoriesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @category = Category.find(params[:id])
    #@posts = Post.where(category: @category)

    if params[:query].present?
      sql_query = <<~SQL
      posts.title ILIKE :query
      OR posts.description ILIKE :query
      OR users.nickname ILIKE :query
      SQL
      @posts = Post.joins(:user).where(sql_query, query: "%#{params[:query]}%")
      # sql_query = "title ILIKE :query OR description ILIKE :query"
      # @user = User.where("nickname ILIKE ?", "%#{params[:query]}%")
      # @posts = Post.where(sql_query, query: "%#{params[:query]}%")
      #  @posts = Post.where(user: @user)
    else
      @posts = Post.where(category: @category)
    end

    authorize @category
  end
end
