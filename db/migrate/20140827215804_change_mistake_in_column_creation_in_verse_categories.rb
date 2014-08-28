class ChangeMistakeInColumnCreationInVerseCategories < ActiveRecord::Migration
  def change
    change_table :verse_categories do |t|
      t.rename :post_id, :verse_id
end
  end
end
