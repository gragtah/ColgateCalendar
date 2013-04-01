class UsersController < ApplicationController
	def login
		render 'login'
	end
	
	def authenticate
		if user.authenticated?(params[:username], params[:password])
			redirect_to "/"
		else
			flash[:warning] = "Invalid Credentials!"
			redirect_to "/login"
			return
		end
	end
end
