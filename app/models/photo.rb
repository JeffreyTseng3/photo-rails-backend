# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord 
    validates :title, presence: true 
    has_one_attached :image_file

    belongs_to :user 

    has_many :collection_items

    has_many :collectors, 
        through: :collection_items,
        source: :user

    has_many :comments
    
end
