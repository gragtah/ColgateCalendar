require 'spec_helper'

describe EventsController do
	describe "events by time" do
                before(:each) do
                        session[:logged_in] = true
                        session[:username] = "user"
    	        	fake_user = mock(User, :username => "user", :tags => "arts") 
                        User.stub!(:find_by_username).with("user").and_return(fake_user)
                        Event.should_receive(:find).with(:all, hash_including(:conditions => anything))
                end
		it "should render events today" do
			get :events_today
			response.should render_template :events_list
		end
		it "should render events tomorrow" do
			get :events_tomorrow
			response.should render_template :events_list
		end
		it "should render events this week" do
			get :events_this_week
			response.should render_template :events_list
		end
	end

	describe "show all events" do
		it "should show all events" do
                        Event.should_receive(:all)
			get :index
			response.should render_template :index
			#Really hope this works, its a super complex function
		end
	end
	
	describe "fetch and save events" do
		it "should fetch and save events" do
                        Event.should_receive(:create).at_least(1).times
#Event.should_receive(:fetch_and_save_events)
			get :fetch_and_save_events
			response.should render_template :fetch_and_save_events
			#I actually spent more time trying to think of a witty comment than writing this test. 
		end
	end

end