json.(photo, :id, :title, :user_id)
json.imageUrl rails_blob_url(photo.image_file)
json.comments photo.comments
