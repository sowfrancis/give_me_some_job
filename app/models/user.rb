class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :userimg, UserImgUploader

  has_many :tags

  geocoded_by :address   # can also be an IP address
	after_validation :geocode   

	def fullname
		"#{firstname} #{lastname}"
	end
end
