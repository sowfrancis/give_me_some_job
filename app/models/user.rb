class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :userimg, UserImgUploader

  has_many :tags
  has_many :messages, as: :sender

  geocoded_by :address   # can also be an IP address
	after_validation :geocode  

  validates_format_of :email, with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ 

	def fullname
		"#{firstname} #{lastname}"
	end
end
