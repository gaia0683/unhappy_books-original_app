class AddCategoryIdFromRatings < ActiveRecord::Migration[6.1]
  def change
    add_column :ratings, :category_id, :integer
  end
end
