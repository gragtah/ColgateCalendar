require 'thumbs_up'
class UsersController < ApplicationController
    
    def login
        redirect_to user_omniauth_authorize_path(:google_oauth2)
    end

    def logout
       reset_session
       flash[:info] = "You have logged out successfully!"
       redirect_to "/"
    end
    
    def settings
        if session[:logged_in] == true and session[:id].to_i == params[:id].to_i
            @all_tags = ColgateCalendar::Application.config.tags.sort
            @selected_tags = User.find(session[:id]).tags.downcase.split(',')
            render 'settings'
        else
            redirect_to "/"
        end
    end

    def update_tags
        @user = User.find(session[:id])
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
