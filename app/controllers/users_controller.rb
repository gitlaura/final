class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.fname = params[:fname]
    @user.lname = params[:fname]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    puts params[:password]
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.fname = params[:fname]
    @user.lname = params[:lname]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.password.present? && @user.password == params[:password_confirmation]
      if @user.save
        flash[:notice] = "Account updated successfully."
        redirect_to user_url(@user.id)
      else
        render 'edit'
      end
    else
      @user.errors.add(:password, "does not match")
      render 'edit'
    end
  end

end
