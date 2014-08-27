class Category < ActiveRecord::Base
  def index
    @all_categories=Category.all
    binding.pry
  end
end