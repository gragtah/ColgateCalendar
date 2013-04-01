Class UsersController < ApplicationController

    def authenticate
        if user.authenticated?
            redirect_to "/home"
        else
            flash[:warning] = "Invalid Credentials!"
            redirect_to "/login"
            return
        end
    end
