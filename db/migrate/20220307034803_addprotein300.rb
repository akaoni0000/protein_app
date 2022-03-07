class Addprotein300 < ActiveRecord::Migration[6.1]
  def change
    remove_column :proteins, :protein_height, :integer
    remove_column :proteins, :height, :integer
    remove_column :proteins, :large_height, :integer
    add_column :proteins, :protein_weight, :integer
    add_column :proteins, :qqweight, :integer
    add_column :proteins, :internal_weight, :integer
  end
end
