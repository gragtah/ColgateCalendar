class UsersController < ApplicationController
    
    def login
        render 'login'
    end
    
    def verify_credentials
            if user.correct_password?(params[:password])
                    #To Do: Update session to indicate user is logged in
                    redirect_to "/"
            else
                    flash[:warning] = "Invalid Credentials!"
                    redirect_to "/login"
                    return
            end
    end
end
