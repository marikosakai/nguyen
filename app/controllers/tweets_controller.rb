class TweetsController < ApplicationController
	def new
	end

	def create
		Tweet.create(content: params[:tweet],
					user_id: session[:user_id])
	end

	def index
		user = User.find_by_id(session[:user_id])
		@tweets = user.tweets
	end
end
