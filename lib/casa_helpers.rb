# require needed files
require 'helpers/house_recommendations'
require 'helpers/user_recommendations'

# create BreadExpressHelpers
module CasaHelpers
  include CasaHelpers::HouseRecommendations
  include CasaHelpers::UserRecommendations
end