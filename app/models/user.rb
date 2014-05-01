require 'bcrypt'
class User < ActiveRecord::Base
	attr_accessor :password, :password_confirmation
	before_save :encrypt_password

	validates_presence_of :email
	validates_uniqueness_of :email
	validates_confirmation_of :password

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end
end