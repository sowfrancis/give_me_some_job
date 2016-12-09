class Job < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings, :dependent => :destroy
	belongs_to :recruiter

	validates_presence_of :name, :description, :address, :contact


	mount_uploader :jobimg, JobImgUploader

	geocoded_by :address   # can also be an IP address
	after_validation :geocode

	scope :in_place_named, -> (place_name) {
		near(place_name)
	}

	scope :name_tag, -> (name) {
		joins(:tags).where(tags: {name: name})
	}

	def self.search(search)
		in_place_named("%#{search}%")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |name|
	   	Tag.where(name: name.strip).first_or_create!
	  end
	end

	def tag_list
	  self.tags.map(&:name).join(", ")
	end
end
