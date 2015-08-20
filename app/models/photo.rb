class Photo < ActiveRecord::Base
  acts_as_taggable
	validates :name, :image, presence: true
	belongs_to :album 
	mount_uploader :image, ImageUploader


end
