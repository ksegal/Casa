
class User < ActiveRecord::Base
  # Use built-in rails support for password protection
  has_secure_password

  # Relationships
  has_one :preference
  has_many :houses

  # Scopes
  scope :by_gender,      -> { order(:gender) }
  scope :alphabetical,  -> { order(:last_name).order(:first_name) }

  # Validations
  validates :username, presence: true, uniqueness: { case_sensitive: false}
  validates :gender, inclusion: { in: %w[male female not_specified], message: "is not a recognized gender in system" }
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
