# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  comment_body :text             not null
#  photo_id     :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ApplicationRecord
  validates :comment_body, presence: true
  
  belongs_to :photo
  belongs_to :user

  default_scope { order(created_at: :desc) }
end
