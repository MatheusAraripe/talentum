class PagesController < ApplicationController
  def home
    @categories = Category.all
  end
end
