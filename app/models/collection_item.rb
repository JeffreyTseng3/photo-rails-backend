# == Schema Information
#
# Table name: collection_items
#
#  id         :integer          not null, primary key
#  photo_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CollectionItem < ApplicationRecord
  belongs_to :photo
  belongs_to :user

  default_scope { order(created_at: :desc) }
end
