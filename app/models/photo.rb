class Photo < ActiveRecord::Base
	validates :url, :venue_id, presence: true

	belongs_to :venue
end
