class CreateRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :relations do |t|

      t.integer :user_id
      t.integer :protein_id

      t.timestamps
    end
  end
end
