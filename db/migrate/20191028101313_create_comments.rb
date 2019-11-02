class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false 
      t.references :photo, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
