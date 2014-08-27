class Verse < ActiveRecord::Base
has_many :verse_categories
has_many :categories, through: :verse_categories
end