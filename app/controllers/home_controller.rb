class HomeController < ApplicationController

  def home
    if (current_user && current_user.owner?)
      @recommended_houses = find_house_recommendations
      @recommended_users = find_user_recommendations
      @my_house = current_user.houses.active.first

    elsif (current_user)
      @recommended_houses = find_house_recommendations
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

  def find_user_recommendations
    #return a list of recommended users for a house based on their preferences
    all_users = User.all
    recommended_users = Array.new
    all_users.each do |u|
      matches = find_num_of_user_matches(u)
      #num of matches for a user to show up, will probably increase
      if (matches > 4)
          recommended_users << u
      end
    end
    return recommended_users
  end

  def find_num_of_user_matches(user)
    matches = 0
    house = current_user.houses.active.first
    if ((user.preference.gender_pref != nil) && (user.preference.gender_pref == house.gender))
      matches += 1
    end
    if ((user.preference.neighborhood_pref != nil) && (user.preference.neighborhood_pref == house.neighborhood))
      matches += 1
    end
    if ((user.preference.season_pref != nil) && (user.preference.season_pref == house.season))
      matches += 1
    end
    if ((user.preference.smoking_pref != nil) && (user.preference.smoking_pref == house.smoking))
      matches += 1
    end
    if ((user.preference.drinking_pref != nil) && (user.preference.drinking_pref == house.drinking))
      matches += 1
    end
    if ((user.preference.price_limit_pref != nil) && (user.preference.price_limit_pref > house.price))
      matches += 1
    end
    return matches
  end


  def find_house_recommendations
    # return a list of recommended houses for a user based on their preferences
    all_houses = House.all
    recommended_houses = Array.new
    all_houses.each do |h|
      matches = find_num_of_house_matches(h)
      #num of matches for a house to show up, will probably increase
      #when we get more houses in system
      if (matches > 4) 
        recommended_houses << h
      end
    end
    return recommended_houses
  end

  def find_num_of_house_matches(house)
    matches = 0
    if ((current_user.preference.gender_pref != nil) && (current_user.preference.gender_pref == house.gender))
      matches += 1
    end
    if ((current_user.preference.neighborhood_pref != nil) && (current_user.preference.neighborhood_pref == house.neighborhood))
      matches += 1
    end
    if ((current_user.preference.season_pref != nil) && (current_user.preference.season_pref == house.season))
      matches += 1
    end
    if ((current_user.preference.smoking_pref != nil) && (current_user.preference.smoking_pref == house.smoking))
      matches += 1
    end
    if ((current_user.preference.drinking_pref != nil) && (current_user.preference.drinking_pref == house.drinking))
      matches += 1
    end
    if ((current_user.preference.price_limit_pref != nil) && (current_user.preference.price_limit_pref > house.price))
      matches += 1
    end
    return matches
  end

end