class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|

      t.string :name
      t.string :email
      t.string :avatar_image
      t.string :passwore_digest

      t.timestamps
    end
  end
end
