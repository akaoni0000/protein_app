class Addprotein30 < ActiveRecord::Migration[6.1]
  def change
    
    remove_column :proteins, :qqweight, :integer
    add_column :proteins, :weight, :integer
    
  end
end
