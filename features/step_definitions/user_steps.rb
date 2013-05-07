# Declarative step for populating the DB with users.
require_relative '../../spec/spec_helper'

Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        User.create!(user)
    end
end

#Given /^I am logged in as "(.+)" with password "(.+)"$/ do |username, password|
#   step %{I am on the login page}
#   step %{I fill in "Username" with "#{username}"}
#   step %{I fill in "Password" with "#{password}"}
#   step %{I press "Login"}
#   step %{I should be on the home page}
#    step %{I should see "Logged in as user"}
#end

Given /I am a logged in user/i do
#  email = "test1@test.com"
#   password = "somepassword123"
#  User.new(:email => email, :password => password).save!    
#  visit '/users/sign_in'
#  fill_in "user_email", :with => email
#  fill_in "user_password", :with => password
#  click_button "Sign in"
   $logged_in = true
   page.set_rack_session(:id => 1, :email => "test@test.com", :logged_in => true)
end

Given /^username with email "(.+)" has set the following tags: (.*)$/ do |email, tag_list|
    user = User.find_by_email(email)
    user.tags = tag_list.gsub(' ', '') 
    user.save!
end

When /^(?:|I )upvote event with id (.*)$/  do |event_id|
  page.set_rack_session(:return_to => "/events/past?page=1&size=1")
  visit "/events/#{event_id}/upvote"
end

When /^(?:|I )downvote event with id (.*)$/  do |event_id|
  page.set_rack_session(:return_to => "/events/past?page=1&size=1")
  visit "/events/#{event_id}/downvote"
end

When /^(?:|I )unvote event with id (.*)$/  do |event_id|
  page.set_rack_session(:return_to => "/events/past?page=1&size=1")
  visit "/events/#{event_id}/unvote"
end

Given /^(?:|I )have not voted for event with id (.*)$/  do |event_id|
  page.set_rack_session(:return_to => "/events/past?page=1&size=1")
  visit "/events/#{event_id}/unvote"
end
