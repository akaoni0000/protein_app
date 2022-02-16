class AddProteins < ActiveRecord::Migration[6.1]
  def change
    add_column :proteins, :feature, :text
    add_column :proteins, :price, :integer
    add_column :proteins, :protein_images, :string
    add_column :proteins, :height, :integer
    add_column :proteins, :protein_height, :integer
    remove_column :proteins, :body, :text
    remove_column :proteins, :score, :integer
  end
end
