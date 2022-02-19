class Protein3 < ActiveRecord::Migration[6.1]
  def change
    remove_column :proteins, :protein_image, :string
  end
end
