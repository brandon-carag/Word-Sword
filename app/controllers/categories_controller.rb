class CategoriesController  < ApplicationController
  def index
    @all_categories=Category.all.order("name")
  end

end