class CreateVerseCategories < ActiveRecord::Migration
  def change
    create_table :verse_categories do |t|
      t.integer :post_id, :category_id
      t.timestamps
    end
  end
end
