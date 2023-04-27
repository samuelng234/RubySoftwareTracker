class AddCategoryIdToTools < ActiveRecord::Migration[7.0]
  def change
    add_reference :tools, :category
    add_foreign_key :tools, :categories, column: :category_id
  end
end
