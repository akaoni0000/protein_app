class Protein333 < ActiveRecord::Migration[6.1]
  def change
      add_column :proteins, :large_height, :integer
  end
end
