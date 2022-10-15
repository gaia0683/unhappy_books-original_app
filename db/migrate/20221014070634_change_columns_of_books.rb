class ChangeColumnsOfBooks < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :title, :string, null: false
    change_column :books, :image, :string, null: false
    change_column :books, :author, :string, null: false
    change_column :books, :publisher_name, :string, null: false
    change_column :books, :url, :string, null: false
    change_column :books, :isbn, :bigint, null: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
