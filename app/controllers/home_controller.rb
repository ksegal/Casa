class HomeController < ApplicationController

  def home
    if current_user
      #@recommendations will go here!
    else
      redirect_to login_path
    end
  end

  def about
  end

  def privacy
  end

  def contact
  end

end