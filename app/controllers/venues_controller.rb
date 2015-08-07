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

  def update
    @photo = Photo.new
    @venue = Venue.find_by(:id => params["id"])
    @venue.name = params['venue']['name']
    @venue.city = params['venue']['city']
    @venue.state = params['venue']['state']
    @venue.address1 = params['venue']['address1']
    @venue.address2 = params['venue']['address2']
    @venue.cuisine = params['venue']['cuisine']
    @venue.neighborhood = params['venue']['neighborhood']
    @venue.reservations = params['reservations']
    @venue.url = params['venue']['url']
    @venue.desc = params['venue']['desc']
    @venue.save
    if @venue.save
    	photo_urls = params['photo_urls'].split(",")
    	photo_urls.each do |photo_url|
    		@photo = Photo.new
    		@photo.url = photo_url
    		@photo.venue_id = @venue.id
    		if @photo.save == false
    			render 'edit'
    		end
    	end
      redirect_to '/my_venues'
    else
      render 'edit'
    end
  end

  def edit
    @photo = Photo.new
    @venue = Venue.find_by(:id => params["id"])
  end

  def new
    @venue = Venue.new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @venue = Venue.new
    @venue.name = params['name']
    @venue.city = params['city']
    @venue.state = params['state']
    @venue.address1 = params['address1']
    @venue.address2 = params['address2']
    @venue.cuisine = params['cuisine']
    @venue.neighborhood = params['neighborhood']
    @venue.reservations = params['reservations']
    @venue.url = params['url']
    @venue.desc = params['desc']
    @venue.created_at = Time.now
    @venue.user_id = session[:user_id]
    if @venue.save
    	photo_urls = params['photo_urls'].split(",")
    	photo_urls.each do |photo_url|
    		@photo = Photo.new
    		@photo.url = photo_url
    		@photo.venue_id = @venue.id
    		if @photo.save == false
    			render 'new'
    		end
    	end
      redirect_to '/my_venues'
    else
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
    @submitted_by = User.find_by_id(@venue.user_id)
    @photos = @venue.photos
    @liked = false
    @saved = false

    @user = User.find_by_id(session[:user_id])
    if @user
      likes = @user.likes
      if likes.count > 0 and likes.where(:venue_id => @venue.id).count > 0
        @liked = true
      end

      saves = @user.holds
      if saves.count > 0 and saves.where(:venue_id => @venue.id).count > 0
        @saved = true
      end
    end
  end

  def my_venues
    user = User.find_by_id(session[:user_id])
    @venues = user.venues.order("created_at desc")
  end

  def saved
    user = User.find_by_id(session[:user_id])
    @saves = user.holds
  end

end
