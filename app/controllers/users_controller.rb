class UsersController < ApplicationController
    
    def login
        render 'login'
    end
    
    def verify_credentials
            username = params[:login][:username]
            user = User.find_by_username(username)
            if user.nil?
                    flash[:warning] = "Username Invalid!"
                    redirect_to "/user/login"
            elsif user.correct_password?(params[:login][:password])
                    session[:logged_in] = true
                    session[:username] = username
                    redirect_to "/"
            else
                    flash[:warning] = "Invalid Credentials!"
                    redirect_to "/user/login"
            end
    end
end
