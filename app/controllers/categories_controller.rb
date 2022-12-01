class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    #@posts = Post.where(category: @category)

    if params[:query].present?
      sql_query = <<~SQL
        posts.title @@ :query
        OR posts.description @@ :query
        OR users.nickname @@ :query
      SQL
       @posts = Post.joins(:user).where(sql_query, query: "%#{params[:query]}%")
     # sql_query = "title ILIKE :query OR description ILIKE :query"
     # @user = User.where("nickname ILIKE ?", "%#{params[:query]}%")
     # @posts = Post.where(sql_query, query: "%#{params[:query]}%")
    #  @posts = Post.where(user: @user)
    else
      @posts = Post.where(category: @category)
    end
  end
end
