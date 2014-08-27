class CategoriesController  < ApplicationController
  def index
    @all_categories=Category.all
  end

end