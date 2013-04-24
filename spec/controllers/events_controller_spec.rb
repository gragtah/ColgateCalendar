require 'spec_helper'

describe EventsController do
	describe "events by time" do
                before(:each) do
                        session[:logged_in] = true
                        session[:username] = "user"
                        fake_user = mock(User, :username => "user", :tags => "arts") 
                        User.stub!(:find_by_username).with("user").and_return(fake_user)
                end
		it "should render events today" do
			get :events_today, {:page => 1, :size => 1}
        		response.should render_template :events_list
		end
		it "should render events tomorrow" do
			get :events_tomorrow, {:page => 1, :size => 1}
			response.should render_template :events_list
		end
		it "should render events this week" do
			get :events_this_week, {:page => 1, :size => 1}
			response.should render_template :events_list
		end
                it "should render past events" do
                        get :events_past, {:page => 1, :size => 1}
                        response.should render_template :events_list
                end
		it "should redirect with correct params for events today" do
			get :events_today
                        response.redirect_url.should match(%r{/events/today})
		end
		it "should redirect with correct params for events tomorrow" do
			get :events_tomorrow
                        response.redirect_url.should match(%r{/events/tomorrow})
		end
		it "should redirect with correct params for events this week" do
			get :events_this_week
                        response.redirect_url.should match(%r{/events/week})
		end
                it "should redirect with correct params for past events" do
                        get :events_past
                        response.redirect_url.should match(%r{/events/past})
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
	
	describe "lookup event details" do
		it "should display details for a given event" do
			fake_event = mock(Event, :guid => 0, :description => "Walrus Hunting! Bring your own crossbow.")
			#Event.stub!(:details).with(fake_event).and_return(fake_event.description)
			#fake_event.should_receive(:details)
                        Event.should_receive(:find).with(1).and_return(fake_event)
                        get :show, {:id => 1}
			response.should render_template :event
		end
	end

	describe "ratings functionality" do
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

        it "should allow certain pre-determined users to view event ratings" do
            session[:logged_in] = true
            session[:username] = "user"
#TODO: Decide if user "user" should be the one we hand over to event admins to view ratings for all events, or add a column to certain users that allow viewing their own event's ratings. 
# Since events are entered into an external system, how do we connect users to events they 'created'? And also, should they only be able to view their own ratings? Relative sense of rating is probably more helpful.
            Event.should_receive(:rating_for_event).with(1)
            get :show, {:id => 1}
			response.should render_template :show

        end
	end
	
	describe "RSVPing" do
	
		it "should allow users to RSVP and un-RSVP to events" do
			fake_event = mock(Event, :guid => 2)
			session[:logged_in] = true
			session[:username] = "user"
			fake_user = mock(User, :username => "user")
			#Two different methods, one to check whether a user has RSVPed, and another to update the RSVP list.
			fake_event.should_receive(:checkRSVP).with("user").and_return(false)
			fake_event.should_receive(:addRSVP).with("user").and_return(true)
			fake_event.should_receive(:checkRSVP).with("user").and_return(true)
			fake_event.should_receive(:removeRSVP).with("user").and_return(true)
			fake_event.should_receive(:checkRSVP).with("user").and_return(false)
			
		end
	end
	

end
