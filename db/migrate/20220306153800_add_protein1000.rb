class AddProtein1000 < ActiveRecord::Migration[6.1]
  def change
      add_column :proteins, :ratio, :integer
  end
end
