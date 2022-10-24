class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.float :point
      t.references :review, foreign_key: true
      t.timestamps
    end
  end
end
