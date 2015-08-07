class User < ActiveRecord::Base
	validates :fname, presence: true
	validates :lname, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, confirmation: true
	
	has_many :likes
	has_many :holds
	has_many :venues
end
