class Protein2 < ActiveRecord::Migration[6.1]
  def change
    add_column :proteins, :score, :integer
  end
end
