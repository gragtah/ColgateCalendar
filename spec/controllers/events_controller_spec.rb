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
		end
	end
	
	describe "fetch and save events" do
		it "should fetch and save events" do
            Event.should_receive(:create).at_least(1).times
			get :fetch_and_save_events
			response.should render_template :fetch_and_save_events
		end
	end
	
	#Everything below this line is unimplemented and should fail
	describe "lookup event details" do
		it "should display details for a given event" do
			fake_event = mock(Event, :guid => 0, :description => "Walrus Hunting! Bring your own crossbow.")
			#Event.stub!(:details).with(fake_event).and_return(fake_event.description)
			fake_event.should_receive(:details)
			#To do: this should render the URL of the event profile.
			#Check to make sure the descriptions match. 
		end
		
		#Can't make this more detailed till we decide how we're storing the feedback
		it "should display feedback for a given event" do
			fake_event = mock(Event, :guid => 1)
			fake_event.should_receive(:details)
			fake_event.should_receive(:return_votes)
			#To do: this should render the URL of the event profile.
			#Check to make sure the upvotes and downvotes are correct.
		end
	end
	
	describe "leave feedback" do
		it "should allow users to leave upvotes" do
			fake_event = mock(Event, :guid => 2)
			session[:logged_in] = true
			session[:username] = "user"
			fake_user = mock(User, :username => "user")
			#First time, user should be able to leave feedback.
			fake_event.should_receive(:upvote).with("user").and_return(true)
			#Update event feedback.
			#However, a repeat vote shouldn't be allowed
			fake_event.should_receive(:upvote).with("user").and_return(false)
		end
                    #TODO:if user has upvoted, they should be able to downvote instead, and vice versa
                    # also they should be able to click on their voted choice to unvote too. :unvote method
		
		it "should allow users to leave downvotes" do
			fake_event = mock(Event, :guid => 2)
			session[:logged_in] = true
			session[:username] = "user"
			fake_user = mock(User, :username => "user")
			#First time, user should be able to leave feedback.
			fake_event.should_receive(:downvote).with("user").and_return(true)
			#Update event feedback.
			#However, a repeat vote shouldn't be allowed
			fake_event.should_receive(:downvote).with("user").and_return(false)
		end
	end
	


end
