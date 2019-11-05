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
  
  # def self.authenticate(username, password)
  #   user = User.find_by(username: username)
  #   user && user.authenticate(password)
  # end
  
  attr_reader :password
    after_initialize :ensure_session_token 
    # 
    def self.find_by_credentials(username,  password) 
        user =  User.find_by(username: username) 
        user && user.valid_password?(password) ? user : nil 
    end 

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end 

    def valid_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token! 
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end
end
