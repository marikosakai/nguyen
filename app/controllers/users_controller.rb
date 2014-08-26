class UsersController < ApplicationController
	def new
	end
	
	def create
		User.create(name: params[:name], 
					email: params[:email],
					password: params[:password],
					password_confirmation: params[:password_confirmation])
		flash[:notice] = "Your account has been created."
		redirect_to root_path
	end

	def show
		@user = User.find_by_id(params[:id])
		@tweets = @user.tweets


	end
end
