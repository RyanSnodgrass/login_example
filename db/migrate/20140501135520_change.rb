class Change < ActiveRecord::Migration
  def change
  	rename_column :users, :passsword_salt, :password_salt
  end
end
