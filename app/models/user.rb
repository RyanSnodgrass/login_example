class User < ActiveRecord::Base
	attr_accessor :password, :password_confirmation

	validates_presence_of :email
	validates_uniqueness_of :email
	validates_confirmation_of :password
end
