class ChangeAdminOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :admin, :boolean, null: false, :default => false
    #Ex:- :default =>''
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
