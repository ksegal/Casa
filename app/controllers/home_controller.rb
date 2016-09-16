class HomeController < ApplicationController

  def home
    if (current_user && current_user.owner?)
      #@recommendations for house and users will go here!
      @recommended_houses = find_house_recommendations

    elsif current_user
      @recommended_houses = find_house_recommendations
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

  private
  def find_house_recommendations
    # return a list of recommended house IDs for a user
    # based on their preferences and render houses matching those ids
    all_houses = House.all
    recommended_houses = Array.new
    all_houses.each do |h|
      matches = find_num_of_matches(h)
      #num of matches for a house to show up, will probably increase
      #when we get more houses in system
      if (matches > 4) 
        recommended_houses << h
      end
    end
    return recommended_houses
  end

  def find_num_of_matches(house)
    matches = 0
    if (current_user.Preference.gender_pref == house.gender)
      matches += 1
    end
    if (current_user.Preference.neighborhood_pref == house.neighborhood)
      matches += 1
    end
    if (current_user.Preference.season_pref == house.season)
      matches += 1
    end
    if (current_user.Preference.smoking_pref == house.smoking)
      matches += 1
    end
    if (current_user.Preference.drinking_pref == house.drinking)
      matches += 1
    end
    if (current_user.Preference.price_limit_pref > house.price)
      matches += 1
    end
    return matches
  end

end