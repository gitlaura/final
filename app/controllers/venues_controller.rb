class VenuesController < ApplicationController

	def index
    # Check for keyword search
    if params["keyword"].present?
      k = params["keyword"].strip
      @venues = Venue.where("name LIKE '%#{k}%' OR neighborhood LIKE '%#{k}%'").order("created_at desc")
    elsif params["city"].present?
      c = params["city"]
      @venues = Venue.where(:city => c).order("created_at desc")
    else
      @venues = Venue.order("created_at desc")
    end
    
    # Paginate 10 results at a time
    if params[:page]
      page_no = params[:page]
    else 
      page_no = 1
    end
    @venues = @venues.page(page_no).per(10)

    # If logged in, pass likes and saves
    @user = User.find_by_id(session[:user_id])
    if @user
      @likes = @user.likes
      @saves = @user.holds
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

      # Save photo urls
      @venue.photos.delete
      photo_urls = params['photo_urls'].split(",")
      photo_urls.each do |photo_url|
        photo_url = photo_url.downcase
        old_photo = Photo.find_by(:url => photo_url)

        # Some error checking
        if (old_photo == nil and photo_url.include? "http")
          @photo = Photo.new
          @photo.url = photo_url
          @photo.venue_id = @venue.id
          @photo.save
        end
      end
      redirect_to '/venues'
    else
      render 'edit'
    end
  end

  def edit
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
      # Save photo urls
    	photo_urls = params['photo_urls'].split(",")
    	photo_urls.each do |photo_url|
        photo_url = photo_url.downcase
        # Some error checking
        if (photo_url.include? "http")
          @photo = Photo.new
          @photo.url = photo_url
          @photo.venue_id = @venue.id
          @photo.save
        end
      end
      redirect_to '/venues'
    else
      render 'new'
    end
  end

  def destroy
    venue = Venue.find_by(:id => params["id"])
    venue.delete
    redirect_to '/venues'
  end

  def show
    @venue = Venue.find_by(:id => params["id"])
    @submitted_by = User.find_by_id(@venue.user_id)
    @photos = @venue.photos

    # If logged in, pass likes and saves
    @user = User.find_by_id(session[:user_id])
    if @user
      @likes = @user.likes
      @saves = @user.holds
    end
  end

  def my_venues
    user = User.find_by_id(session[:user_id])
    @venues = user.venues.order("created_at desc")

    # Paginate 10 results at a time
    if params[:page]
      page_no = params[:page]
    else 
      page_no = 1
    end
    @venues = @venues.page(page_no).per(10)
  end

  def saved
    user = User.find_by_id(session[:user_id])
    @saves = user.holds

    # Paginate 10 results at a time
    if params[:page]
      page_no = params[:page]
    else 
      page_no = 1
    end
    @saves = @saves.page(page_no).per(10)
  end

end
