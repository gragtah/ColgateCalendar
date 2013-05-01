# Declarative step for populating the DB with events.

Given /the following events exist/ do |events_table|
    events_table.map_column!('start') do |date| 
        if date == 'TODAYS_DATE'
            date = DateTime.now
        elsif date == 'TOMORROWS_DATE'
            date = DateTime.now.tomorrow 
        elsif date == 'YESTERDAYS_DATE'
            date = DateTime.yesterday.at_beginning_of_day
        end
        date
    end
    events_table.map_column!('finish') do |date| 
        if date == 'TODAYS_DATE'
            date = DateTime.now 
        elsif date == 'TOMORROWS_DATE'
            date = DateTime.now.tomorrow 
        elsif date == 'YESTERDAYS_DATE'
            date = DateTime.yesterday.at_beginning_of_day
        end
        date
    end
    events_table.hashes.each do |event|
        Event.create!(event)
    end
end


Given /I am a logged in user/i do
    email = "test@test.com"
    password = "somepassword123"
    User.new(:email => email, :password => password).save!    
    visit '/users/sign_in'
    fill_in "user_email", :with => email
    fill_in "user_password", :with => password
    click_button "Sign in"
end

#TODO When I follow link for event
