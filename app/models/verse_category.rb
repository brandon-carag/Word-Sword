class VerseCategory < ActiveRecord::Base;
  belongs_to :verse
  belongs_to :category

end