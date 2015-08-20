class Album < ActiveRecord::Base
	has_many :photos, dependent: :destroy
	belongs_to :designer
end
