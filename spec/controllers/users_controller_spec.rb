require 'spec_helper'

describe UsersController, :type => :controller do
	describe "check user credentials" do
		it "should authenticate valid users" do
			     
      			fake_user = mock(User, :username => "user", :password => "password") 
      			User.stub!(:find_by_username).with("user").and_return(fake_user)
                        fake_user.stub!(:correct_password?).with("password").and_return(true)

			User.verify_credentials?("user", "password").should == true
			post :authenticate, :login => {:username =>"user", :password => "password"} 
			response.should redirect_to("/")
			session[:username].should == "user"
			session[:logged_in].should == true
			flash[:info].should == "Welcome, user!"

	
		end
		
		it "should not authenticate invalid credentials" do
		  	fake_user2 = mock(User, :username => "user", :password => "password") 
      			User.stub!(:find_by_username).with("user").and_return(fake_user2)
      			fake_user2.stub!(:correct_password?).with("notpassword").and_return(false)

			User.verify_credentials?("user", "notpassword").should == false
			post :authenticate, :login => {:username =>"user", :password => "notpassword"} 
			response.should redirect_to(user_login_path)
			flash[:warning].should == "Invalid username/password!"

		end
	end
        
        describe "logout testing" do
        	it "should log the user out" do
                        session[:logged_in] = true
                        session[:username] = "user"
                        session[:id] = 1
                        session[:admin] = true
			fake_user = mock(User, :username => "user", :password => "password") 
      			User.stub!(:find_by_username).with("user").and_return(fake_user)
                        fake_user.stub!(:correct_password?).with("password").and_return(true)
			post :logout
			response.should redirect_to("/")
			session[:username].should == nil
			session[:logged_in].should == nil
			flash[:info].should == "You have logged out successfully!"
		end
	end
	
	describe "login testing" do
		it "should render login" do
			get :login
			response.should redirect_to(user_omniauth_authorize_path(:google_oauth2))
		end
	end

        describe "user settings" do
            it "should allow logged-in user to see the settings page" do
                session[:logged_in] = true
                session[:username] = "user"
                session[:id] = 1
		fake_user = mock(User, :id => 1, :username => "user", :password => "password", :tags => "") 
      		User.stub!(:find).with(1).and_return(fake_user)
                fake_user.should_receive(:tags)
	        get :settings, {:id => 1}
		response.should render_template(:settings)
            end
            it "should allow logged-in user to update tags/keywords" do
                session[:logged_in] = true
                session[:username] = "user"
                session[:id] = 1
		fake_user = mock(User, :id => 1, :username => "user", :password => "password") 
      		User.stub!(:find).with(1).and_return(fake_user)
                fake_user.stub!(:update_tags).with(anything)
                put :update_tags, {:id => 1, :tags => "arts,athletics,faculty"}
		response.should redirect_to "/user/1/settings"
            end
        end
    

end
