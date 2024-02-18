class ChangeDataTypeForArticles < ActiveRecord::Migration[7.1]
  def change
    change_column :articles, :category_id, :text
  end
end
