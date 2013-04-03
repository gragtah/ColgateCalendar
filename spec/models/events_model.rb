require 'spec_helper'

describe Event do
	describe "get events after filtering by tags" do
		session :logged_in = true
		session :username = "user"
		fake_user = mock(User, :username => "user") 
      	tags = User.stub!(:find_by_username).with(session[:username]).tags.downcase.split(','))
      	
		it "should show events matching at least one tag" do
		
		end
		
		it "should not show events not matching any tag" do
		end
	end
end
