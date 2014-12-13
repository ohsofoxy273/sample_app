class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	before_save { self.email = email.downcase }
	validates_presence_of(:name, :email)
	validates :name, length: {maximum: 50}
	validates :email, uniqueness: { case_sensitive: false}, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }
	has_secure_password
	validates :password, length: { minimum: 6 }
end
