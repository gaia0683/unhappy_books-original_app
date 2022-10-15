class AddColumnsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :url, :string
    add_column :books, :isbn, :bigint
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
