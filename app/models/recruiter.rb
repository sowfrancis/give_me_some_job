class Recruiter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :tags
  has_many :jobs

  mount_uploader :recruiterimg, RecruiterImgUploader

  geocoded_by :address 
	after_validation :geocode  
end
