class Change < ActiveRecord::Migration[6.1]
  def change
    add_column :relations, :follow_id, :integer
    add_column :relations, :followed_id, :integer
    remove_column :relations, :user_id, :integer
    remove_column :relations, :protein_id, :integer
  end
end
