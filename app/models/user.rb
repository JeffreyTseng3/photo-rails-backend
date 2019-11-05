# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false }

  has_many :photos

  has_many :collection_items 

  has_many :comments

  has_many :collected_photos, 
    through: :collection_items, 
    source: :photo
  
  def self.authenticate(username, password)
    user = User.find_by(username: username)
    user && user.authenticate(password)
  end
  
end
