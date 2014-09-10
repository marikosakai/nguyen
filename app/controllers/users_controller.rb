class UsersController < ApplicationController
	def new
	end
	
	def create
		user = User.create(name: params[:name], 
					email: params[:email],
					password: params[:password],
					password_confirmation: params[:password_confirmation])
		flash[:notice] = "Your account has been created."

		session[:user_id] = user.id
		redirect_to user_path(user.id)
	end

	def show
		@user = User.find_by_id(params[:id])
		@tweets = @user.tweets


	end
end
