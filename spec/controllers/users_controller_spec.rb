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
        
        describe "correct_password? should return true/false depending on input" do
            it "should call the correct_password? function" do
                dummy = User.new
                dummy.username = "user"
                dummy.password = "password"
                dummy.correct_password?("password").should == true
            end
        end
        
        describe "logout testing" do
        	it "should log the user out" do
			fake_user = mock(User, :username => "user", :password => "password") 
      			User.stub!(:find_by_username).with("user").and_return(fake_user)
                        fake_user.stub!(:correct_password?).with("password").and_return(true)

			User.verify_credentials?("user", "password").should == true
			post :logout, :login => {:username =>"user", :password => "password"} 
			response.should redirect_to("/")
			session[:username].should == nil
			session[:logged_in].should == nil
			flash[:info].should == "You have logged out successfully!"
		end
	end
	
	describe "login testing" do
		it "should render login" do
			get :login
			response.should render_template(:login)
		end
	end


end