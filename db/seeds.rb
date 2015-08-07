Venue.delete_all
Photo.delete_all
Like.delete_all
User.delete_all
Hold.delete_all

venue_data = JSON.parse(open('db/venue.json').read)
photo_data = JSON.parse(open('db/photo.json').read)

user = User.new
user.fname = "Taylor"
user.lname = "Swift"
user.email = "Taylor.Swift@gmail.com"
user.password = "test"
user.admin = false
user.save

user = User.new
user.fname = "Beyonce"
user.lname = "Knowles"
user.email = "beyonce@gmail.com"
user.password = "test"
user.admin = false
user.save

venue_data.each do |venue_hash|
	venue = Venue.new
	venue.name = venue_hash['name']
	venue.address1 = venue_hash['address1']
	venue.address2 = venue_hash['address2']
	venue.zipcode = venue_hash['zipcode']
	venue.state = venue_hash['state']
	venue.city = venue_hash['city']
	venue.neighborhood = venue_hash['neighborhood']
	venue.cuisine = venue_hash['cuisine']
	venue.desc = venue_hash['desc']
	venue.url = venue_hash['url']
	venue.reservations = venue_hash['reservations']
	venue.user_id = User.all.first.id
	venue.save
end

photo_data.each do |photo_hash|
	photo = Photo.new
	photo.url = photo_hash['photo_url']
	photo.venue_id = Venue.where(:name => photo_hash['name']).first.id

	photo.save
end

hold = Hold.new
hold.user_id = User.all.first.id 
hold.venue_id = Venue.where(:name => "Las Fuentes").first.id
hold.save

like = Like.new
like.venue_id = Venue.where(:name => "Las Fuentes").first.id
like.user_id = User.all.first.id
like.save

like = Like.new
like.venue_id = Venue.where(:name => "BarBacon").first.id
like.user_id = User.all.first.id
like.save

like = Like.new
like.venue_id = Venue.where(:name => "BarBacon").first.id
like.user_id = User.all.last.id
like.save

like = Like.new
like.venue_id = Venue.where(:name => "Foreign Cinema").first.id
like.user_id = User.all.last.id
like.save

puts "Seeds updated."