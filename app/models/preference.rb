class Preference < ActiveRecord::Base

	#Relationships
	belongs_to :user

	#arrays for enumerated values
	NEIGHBORHOODS_LIST = [['Squirrel Hill', 'Squirrel Hill'],['Downtown', 'Downtown'],['Point Breeze', 'Point Breeze'],['Highland Park', 'Highland Park'],['Oakland', 'Oakland'],['Shadyside', 'Shadyside'],['South Side', 'South Side'],['Strip District', 'Strip District'],['Bloomfield', 'Bloomfield'],['East Liberty', 'East Liberty'],['Homestead', 'Homestead'],['North Side', 'North Side']]
	ROOMS_LIST = [['Single', 'Single'],['Double', 'Double'],['No Preference', 'No Preference']]
	SEASONS_LIST = [['Winter', 'Winter'],['Spring', 'Spring'],['Summer', 'Summer'],['Fall', 'Fall'],['Year', 'Year']]
	GENDERS_LIST = [['Male', 'Male'], ['Female', 'Female'], ['No Preference', 'No Preference']]

	#Validations
	validates_inclusion_of :neighborhood_pref, in: NEIGHBORHOODS_LIST.map{|key, value| value}, message: "is not a valid option", :allow_blank => true
	validates_inclusion_of :gender_pref, in: GENDERS_LIST.map{|key, value| value}, message: "is not a valid option", :allow_blank => true
	validates_inclusion_of :room_pref, in: ROOMS_LIST.map{|key, value| value}, message: "is not a valid option", :allow_blank => true
	validates_inclusion_of :season_pref, in: SEASONS_LIST.map{|key, value| value}, message: "is not a valid option", :allow_blank => true

	#Scopes
	scope :smoker,        -> { where(smoking_pref: true) }
	scope :drinker,        -> { where(drinking_pref: true) }
	

end
