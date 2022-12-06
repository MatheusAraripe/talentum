class CategoriesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show]

  def show
    @category = Category.find(params[:id])

    if params[:query].present?
      sql_query = <<~SQL
      posts.title ILIKE :query
      OR posts.description ILIKE :query
      OR users.nickname ILIKE :query
      SQL
      posts_query = Post.joins(:user).where(sql_query, query: "%#{params[:query]}%")
      @posts = posts_query.select { |post| post.category == @category }
    else
      @posts = Post.where(category: @category)
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'list', locals: { posts: @posts }, formats: [:html] }
    end

    authorize @category
  end

end
