class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      if !logged_in?
        session[:user_id] = user.id
        redirect_to root_url, notice: "Logged in!"
      else
        redirect_to home_path, notice: "Created new user!"
      end
    else
      flash.now.alert = "Username or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end