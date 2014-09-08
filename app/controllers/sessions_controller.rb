class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:email])

		if user
			if user.authenticate(params[:password])
				session[:user_id] = user.id
				flash[:notice] = "You are signed in."
				redirect_to user_path(user)
			else
				flash[:notice] = "Wrong password."
				redirect_to signin_path
			end
			
		else
			flash[:notice] = "Wrong email."
			redirect_to signin_path
		end
		
	end

	def destroy
		session[:user_id] = nil

		flash[:notice] = "You are signed out."
		redirect_to root_path
	end

end
 