require 'thumbs_up'
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
    
    def settings
        username = session[:username]
        if session[:logged_in] == true and User.find_by_username(username).id == params[:id].to_i
            render 'settings'
        else
            redirect_to "/"
        end
    end

    def update_tags
        @user = User.find_by_username(session[:username])
        if session[:logged_in] == true and @user.id == params[:id].to_i
            @user.update_tags(params[:tags])
            flash[:notice] = "Settings updated!"
            redirect_to "/user/#{params[:id]}/settings"
        else
            flash[:notice] = "Please login before you can edit settings!"
            redirect_to "/user/login"
        end

    end

end
