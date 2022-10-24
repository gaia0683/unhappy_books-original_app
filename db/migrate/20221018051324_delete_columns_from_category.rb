class DeleteColumnsFromCategory < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :categories, :reviews
    remove_reference :categories, :review, index: true
    remove_column :categories, :point
  end
end
