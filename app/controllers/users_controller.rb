class UsersController < ApplicationController

	before_action :authenticate_user!

	def new
		@user = User.new
	end

	def create
		@user = User.new(params_user)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params_user)
			redirect_to user_path(@user)
		else
			render "edit"
		end
	end

	private

	def params_user
		params.require(:user).permit(:firstname, :lastname, :address, :description, :latitude, :longitude, :userimg, :email)
	end
end
