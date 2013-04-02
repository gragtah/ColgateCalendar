class UsersController < ApplicationController
    
    def login
        render 'login'
    end
    
    def authenticate
        username, password = params[:login][:username], params[:login][:password]
        if User.verify_credentials?(username, password)
                session[:logged_in] = true
                session[:username] = username
                flash[:info] = "Welcome, #{username}!"
                redirect_to "/"
        else
                flash[:warning] = "Invalid username/password!"
                redirect_to "/user/login"
        end
    end

    def logout
       reset_session
       flash[:info] = "You have logged out successfully!"
       redirect_to "/"
    end
end
