class Picture < ActiveRecord::Base
	mount_uploader :picture, PhotoUploader

	belongs_to :house

	validates_presence_of :picture
end
