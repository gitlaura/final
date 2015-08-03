class VenuesController < ApplicationController

	def index
    if params["keyword"].present?
      k = params["keyword"].strip
      @venues = Venue.where("name LIKE '%#{k}%' OR neighborhood LIKE '%#{k}%'").order("created_at desc")
    elsif params["city"].present?
      c = params["city"]
      @venues = Venue.where(:city => c).order("created_at desc")
    else
      @venues = Venue.order("created_at desc")
    end
  end

	def my_venues
		#this should only be the venues subitted by the users eventually
		@venues = Venue.order("created_at desc")
	end

  def update
    venue = Venue.find_by(:id => params["id"])
    venue.name = params['venue']['name']
    venue.city = params['venue']['city']
    venue.state = params['venue']['state']
    venue.address1 = params['venue']['address1']
    venue.address2 = params['venue']['address2']
    venue.cuisine = params['venue']['cuisine']
    venue.neighborhood = params['venue']['neighborhood']
    venue.reservations = params['reservations']
    venue.url = params['venue']['url']
    venue.photo_url = params['venue']['photo_url']
    venue.desc = params['venue']['desc']
    venue.save
    redirect_to '/my_venues'
  end

  def edit
    @venue = Venue.find_by(:id => params["id"])
  end

  def new
    @venue = Venue.new
  end

  def create
    venue = Venue.new
    venue.name = params['name']
    venue.city = params['city']
    venue.state = params['state']
    venue.address1 = params['address1']
    venue.address2 = params['address2']
    venue.cuisine = params['cuisine']
    venue.neighborhood = params['neighborhood']
    venue.reservations = params['reservations']
    venue.url = params['url']
    venue.photo_url = params['photo_url']
    venue.desc = params['desc']
    venue.created_at = Time.now
    if venue.save
      redirect_to '/my_venues'
    else
    	#add error text
      render 'new'
    end
  end

  def destroy
    venue = Venue.find_by(:id => params["id"])
    venue.delete
    redirect_to '/my_venues'
  end

  def show
    @venue = Venue.find_by(:id => params["id"])
    #cookies["venue_id"] = @venue.id
  end
end
