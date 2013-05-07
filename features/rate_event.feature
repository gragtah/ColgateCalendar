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
    | Free Food | Andy Kerr | YESTERDAYS_DATE | YESTERDAYS_DATE | sports | test1 | 1  |


Scenario: upvote an event
 Given I am a logged in user
 When I am on the events page for past with page number 1 and size 1
 And I have not voted for event with id 1
 Then I should see "Free Food"
 When I upvote event with id 1
 Then I should see "Free Food"
 Then I should see css "span.upvoted"

Scenario: downvote an event
 Given I am a logged in user
 When I am on the events page for past with page number 1 and size 1
 And I have not voted for event with id 1
 Then I should see "Free Food"
 When I downvote event with id 1
 Then I should see "Free Food"
 And I should see css "span.downvoted"

Scenario: switch from upvote to downvote and back
 Given I am a logged in user
 When I am on the events page for past with page number 1 and size 1
 And I have not voted for event with id 1
 And I upvote event with id 1
 Then I should see "Free Food"
 And I should see css "span.upvoted"
 When I downvote event with id 1
 Then I should see "Free Food"
 Then I should see css "span.downvoted"
 When I upvote event with id 1
 Then I should see "Free Food"
 And I should see css "span.upvoted"

