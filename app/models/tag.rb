class Tag < ActiveRecord::Base
	has_many :taggings
  has_many :jobs, through: :taggings, :dependent => :destroy

  scope :name_tag, -> (name) {
		find_by_name!(name).jobs
	}

	def self.search(search)
		name_tag("%#{search}%")
	end
end
