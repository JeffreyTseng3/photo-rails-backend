class ChangePhotos3 < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :image
  end
end
