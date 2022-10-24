class ChangeNameOfCategory < ActiveRecord::Migration[6.1]
  def change
    change_column :categories, :name, 'integer USING CAST(name AS integer)'
  end
end
