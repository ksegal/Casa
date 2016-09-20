
class User < ActiveRecord::Base
  # Use built-in rails support for password protection
  has_secure_password

  mount_uploader :picture, PhotoUploader

  # Relationships
  has_one :preference, :dependent => :destroy
  has_many :houses

  accepts_nested_attributes_for :preference

  #array for Enumerated Values
  GENDER_LIST = [['Male', 'Male'], ['Female', 'Female'], ['Not Specified', 'Not Specified']]

  # Scopes
  scope :by_gender,      -> { order(:gender) }
  scope :alphabetical,  -> { order(:last_name).order(:first_name) }

  # Validations
  validates :username, presence: true, uniqueness: { case_sensitive: false}
  validates_inclusion_of :gender, in: GENDER_LIST.map{|key, value| value}, message: "is not a valid option"
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, on: :create, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
  validates_presence_of :last_name, :first_name
  validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"

  # Callbacks
  before_save :reformat_phone

  # Other methods
  def name
    "#{last_name}, #{first_name}"
  end

  def proper_name
    "#{first_name} #{last_name}"
  end

  def owner?
    return false if is_owner.nil?
    is_owner == true
  end

  # Private methods
  private
  def reformat_phone
    self.phone = self.phone.to_s.gsub(/[^0-9]/,"")
  end

  # For use in authorizing with CanCan
#  ROLES = [['Administrator', :admin],['Baker', :baker],['Shipper', :shipper],['Customer',:customer]]

#  def role?(authorized_role)
#    return false if role.nil?
#    role.downcase.to_sym == authorized_role
#  end

end
