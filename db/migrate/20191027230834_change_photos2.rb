class ChangePhotos2 < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :image, :string
  end
end
