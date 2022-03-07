class Addprotein30000 < ActiveRecord::Migration[6.1]
  def change
    remove_column :proteins, :internal_weight, :integer
    add_column :proteins, :large_weight, :integer
  end
end
