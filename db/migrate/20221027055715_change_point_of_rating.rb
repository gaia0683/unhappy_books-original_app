class ChangePointOfRating < ActiveRecord::Migration[6.1]
  def change
    change_column :ratings, :point, :float, null: true
  end
end
