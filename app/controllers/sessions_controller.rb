class SessionsController < ApplicationController

  def new
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def create
    user = User.find_by_email(params["email"].downcase)
    if user
      if user.authenticate(params["password"])
        session[:user_id] = user.id
        redirect_to root_url, :notice => "Welcome back, #{user.fname}"
      else
        flash.now[:notice] = "Incorrect password."
        render 'new'
      end
    else
      flash.now[:notice] = "Cannot find email."
      render 'new'
    end
  end

end
