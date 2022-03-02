class Addprotein10 < ActiveRecord::Migration[6.1]
  def change
    add_column :proteins, :taste, :string
  end
end
