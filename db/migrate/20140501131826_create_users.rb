class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :passsword_salt
      t.string :password_hash

      t.timestamps
    end
  end
end
