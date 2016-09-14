class HomeController < ApplicationController
include CasaHelpers::HouseRecommendations
include CasaHelpers::UserRecommendations


  def home
    if current_user && current_user.owner?()
      #@recommendations for house and users will go here!
    
    elsif current_user

      #@recommendations for just houses will go here!

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