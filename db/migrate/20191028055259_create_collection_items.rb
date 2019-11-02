class CreateCollectionItems < ActiveRecord::Migration[6.0]
  def change
    create_table :collection_items do |t|
      t.references :photo, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
