class Category < ActiveRecord::Base
has_many :verse_categories
has_many :verses, through: :verse_categories
end