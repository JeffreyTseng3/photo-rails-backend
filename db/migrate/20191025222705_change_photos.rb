class ChangePhotos < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :image_url
  end
end
