class User2 < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :passwore_digest, :string
    add_column :users, :password_digest, :string
  end
end
