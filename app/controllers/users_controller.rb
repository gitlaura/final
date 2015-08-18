class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]
  before_action :authorize_user, only: [:edit, :show]

  def require_login
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url
    end
  end

  def authorize_user
    if @user.id != params[:id].to_i
      redirect_to root_url    
    end
  end

  def index
    redirect_to root_url
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def create
    @user = User.new
    @user.fname = params[:fname]
    @user.lname = params[:lname]
    @user.email = params[:email].downcase
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Welcome, #{@user.fname}!"
    else
      render 'new'
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.authenticate(params["password"])
      @user.password = params[:password]

      # Check if user tries to update password
      if params[:new_password].present? 
        if params[:new_password] == params[:password_confirmation]
          @user.password = params[:new_password]
        else
          @user.errors.add(:password_confirmation, "does not match")
          render 'edit'
          return
        end
      end

      @user.fname = params[:fname]
      @user.lname = params[:lname]
      @user.email = params[:email].downcase
      if @user.save
        redirect_to user_url(@user.id)
      else
        render 'edit'
      end
    else
      @user.errors.add(:password, "is invalid")
      render 'edit'
    end
  end

  def destroy
    user = User.find_by_id(params["id"])
    user.delete
    redirect_to '/logout'
  end

end
