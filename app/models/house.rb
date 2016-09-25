class House < ActiveRecord::Base
	#arrays for enumerated values
	NEIGHBORHOODS_LIST = [['Squirrel Hill', 'Squirrel Hill'],['Downtown', 'Downtown'],['Point Breeze', 'Point Breeze'],['Highland Park', 'Highland Park'],['Oakland', 'Oakland'],['Shadyside', 'Shadyside'],['South Side', 'South Side'],['Strip District', 'Strip District'],['Bloomfield', 'Bloomfield'],['East Liberty', 'East Liberty'],['Homestead', 'Homestead'],['North Side', 'North Side']]
	SEASONS_LIST = [['Winter', 'Winter'],['Spring', 'Spring'],['Summer', 'Summer'],['Fall', 'Fall'],['Year', 'Year']]
	STATES_LIST = [['Alabama', 'AL'],['Alaska', 'AK'],['Arizona', 'AZ'],['Arkansas', 'AR'],['California', 'CA'],['Colorado', 'CO'],['Connectict', 'CT'],['Delaware', 'DE'],['District of Columbia ', 'DC'],['Florida', 'FL'],['Georgia', 'GA'],['Hawaii', 'HI'],['Idaho', 'ID'],['Illinois', 'IL'],['Indiana', 'IN'],['Iowa', 'IA'],['Kansas', 'KS'],['Kentucky', 'KY'],['Louisiana', 'LA'],['Maine', 'ME'],['Maryland', 'MD'],['Massachusetts', 'MA'],['Michigan', 'MI'],['Minnesota', 'MN'],['Mississippi', 'MS'],['Missouri', 'MO'],['Montana', 'MT'],['Nebraska', 'NE'],['Nevada', 'NV'],['New Hampshire', 'NH'],['New Jersey', 'NJ'],['New Mexico', 'NM'],['New York', 'NY'],['North Carolina','NC'],['North Dakota', 'ND'],['Ohio', 'OH'],['Oklahoma', 'OK'],['Oregon', 'OR'],['Pennsylvania', 'PA'],['Rhode Island', 'RI'],['South Carolina', 'SC'],['South Dakota', 'SD'],['Tennessee', 'TN'],['Texas', 'TX'],['Utah', 'UT'],['Vermont', 'VT'],['Virginia', 'VA'],['Washington', 'WA'],['West Virginia', 'WV'],['Wisconsin ', 'WI'],['Wyoming', 'WY']]
	GENDER_LIST = [['Male', 'Male'], ['Female', 'Female'], ['Not Specified', 'Not Specified']]
	HOUSE_TYPE_LIST = [['Apartment', 'Apartment'], ['Duplex', 'Duplex'], ['House', 'House']]
	LAUNDRY_LIST = [['Washer/dryer in unit', 'Washer/dryer in unit'], ['Washer/dryer in building', 'Washer/dryer in building'], ['Not available', 'Not available']]


	# Relationships
	belongs_to :user
	has_many :pictures

	scope :active,       -> { where(active: true) }

	# Allow pictures to be nested within house
	accepts_nested_attributes_for :pictures, reject_if: ->(picture) { picture[:picture].blank? }

	validates_presence_of :price, :neighborhood, :city, :state, :street_1, :description
	
	validates_numericality_of :price, :num_of_bedrooms, :num_of_bathrooms, greater_than: 0
	validates_format_of :zip, with: /\A\d{5}\z/, message: "should be five digits long"

	validates_inclusion_of :neighborhood, in: NEIGHBORHOODS_LIST.map{|key, value| value}, message: "is not a valid option"
	validates_inclusion_of :season, in: SEASONS_LIST.map{|key, value| value}, message: "is not a valid option"
	validates_inclusion_of :state, in: STATES_LIST.map{|key, value| value}, message: "is not an option"
	validates_inclusion_of :gender, in: GENDER_LIST.map{|key, value| value}, message: "is not a valid option"
	validates_inclusion_of :house_type, in: HOUSE_TYPE_LIST.map{|key, value| value}, message: "is not a valid option"
	validates_inclusion_of :laundry, in: LAUNDRY_LIST.map{|key, value| value}, message: "is not a valid option"

	# # Callbacks
	before_save :make_owner

	def make_owner
		self.user.is_owner = true
	end
end
