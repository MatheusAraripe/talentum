class PagesController < ApplicationController
  before_action :set_categories, only: %i[home]
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @illustration_posts = Post.where(category_id: @illustration).sample(3)
    @painting_posts = Post.where(category_id: @painting).sample(3)
    @photography_posts = Post.where(category_id: @photography).sample(3)
    @drawing_posts = Post.where(category_id: @drawing).sample(3)
  end

  private

  def set_categories
    @illustration = Category.find_by(name: "Illustration").id
    @painting = Category.find_by(name: "Painting").id
    @photography = Category.find_by(name: "Photography").id
    @drawing = Category.find_by(name: "Drawing").id
  end
end
