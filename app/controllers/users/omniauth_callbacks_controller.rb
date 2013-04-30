class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

        if @user.persisted?
            flash[:notice] = "Logged in successfully as #{@user.username}"
            session[:logged_in] = true
            session[:username] = @user.username
            session[:id] = @user.id
            sign_in_and_redirect @user, :event => :authentication
        else
             session["devise.google_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end
end
