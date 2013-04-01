class UsersController < ApplicationController

    def authenticate
        if user.authenticated?
            redirect_to "/"
        else
            flash[:warning] = "Invalid Credentials!"
            redirect_to "/login"
            return
        end
    end
end
