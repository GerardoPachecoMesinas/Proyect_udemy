class RemoveCategoryIdFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :category_id, :text
  end
end
