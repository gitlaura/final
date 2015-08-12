class Venue < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :city, presence: true
	validates :desc, presence: true
	

	has_many :photos
	has_many :likes
	has_many :holds
	belongs_to :user
end
