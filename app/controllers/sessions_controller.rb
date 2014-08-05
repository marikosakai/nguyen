class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "You are signed in."
		else
			flash[:notice] = "Wrong password."
		end

		redirect_to dashboard_path
	end
end
 