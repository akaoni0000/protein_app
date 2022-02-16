class CreateProteins < ActiveRecord::Migration[6.1]
  def change
    create_table :proteins do |t|

      t.string :name
      t.text :body
      t.string :protein_image
      t.integer :user_id
      

      t.timestamps
    end
  end
end
