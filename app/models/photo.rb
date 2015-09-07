class Photo < ActiveRecord::Base
  acts_as_taggable
  acts_as_votable

	belongs_to :album 
	belongs_to :area

	validates :name, :image, presence: true
	
	mount_uploader :image, ImageUploader

end
