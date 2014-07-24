class UsersController < ApplicationController
	def new
	end
	
	def create
		User.create(name: params[:name], email: params[:email])
		flash[:notice] = "Your account has been created."
		redirect_to root_path
	end
end
