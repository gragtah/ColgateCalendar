Feature: Leave Rating for Events

    As a student
    So that event hosts have a sense of how I felt about their event
    I want to be able to rate events with an upvote or downvote

Background: Events exist with downvotes and upvotes
Given the following users exist:
   | username  | password | tags        |  email          |
   | user      | password | art,sports | fake@colgate.edu|  
 
 And the following events exist:
    | title     |location   | start       | finish         | tags   | guid  | id |
    | Free Food | Andy Kerr | TODAYS_DATE | TOMORROWS_DATE | sports | test1 | 1  |



#TODO: Figure out how to 
Scenario: upvote an event
 Given I am a logged in user
 When I am on the events page for today with page number 1 and size 1
 Then I should see "Free Food"
 And I find "upimage"
 Then I should see "Free Food"
 Then I should see css "span.upvoted"

Scenario: downvote an event
 Given I am a logged in user
 When I am on the events page for today with page number 1 and size 1
 Then I should see "Free Food"
 And I find "downimage"
 Then I should see "Free Food"
 And I should see css "span.downvoted"

Scenario: un-upvote an event
 Given I am a logged in user
 When I am on the events page for today with page number 1 and size 1
 Then I should see "Free Food"
 And I should see css "span.upvoted"
 And I find "upimage"
 Then I should see "Free Food"
 Then I should see css "span.upvote"


Scenario: un-downvote an event
 Given I am a logged in user
 When I am on the events page for today with page number 1 and size 1
 Then I should see "Free Food"
 And I should see css "span.downvoted"
 And I find "downimage"
 Then I should see "Free Food"
 Then I should see css "span.downvote"


Scenario: switch from upvote to downvote
 Given I am a logged in user
 When I am on the events page for today with page number 1 and size 1
 Then I should see "Free Food"
 And I should see css "span.upvoted"
 And I find "downimage"
 Then I should see "Free Food"
 Then I should see css "span.downvoted"

Scenario: switch from downvote to upvote
 Given I am a logged in user
 When I am on the events page for today with page number 1 and size 1
 Then I should see "Free Food"
 And I should see css "span.downvoted"
 And I find "upimage"
 Then I should see "Free Food"
 Then I should see css "span.upvoted"
