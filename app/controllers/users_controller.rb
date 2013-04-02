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
       flash[:info] = "You have logged out successfully!"
       reset_session
       #session.delete(:logged_in)
       #session.delete(:username)
       redirect_to "/"
    end

end
