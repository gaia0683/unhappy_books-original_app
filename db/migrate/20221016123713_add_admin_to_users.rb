class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean, null: false, defalut: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
