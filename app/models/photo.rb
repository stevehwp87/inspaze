class Photo < ActiveRecord::Base
  acts_as_taggable
  acts_as_votable

	belongs_to :album 
	belongs_to :area

	validates :name, :image, presence: true
	
	mount_uploader :image, ImageUploader
  	validate :image_size
	
	private
	# Validates the size of an uploaded picture.
		def image_size
			if image.size > 2.megabytes
			errors.add(:image, "Please upload a image less than 2MB")
		end
	end
end
