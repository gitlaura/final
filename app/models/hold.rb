class Hold < ActiveRecord::Base
	validates :user_id, :venue_id, presence: true

	belongs_to :venue
	belongs_to :user
end
