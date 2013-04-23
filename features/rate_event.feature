Feature: Leave Rating for Events
    As a student
    So that event hosts have a sense of how I felt about their event
    I want to be able to rate events with an upvote or downvote

Background: Events exist with downvotes and upvotes
  
  Given the following users exist:
    | username | password| tags |
    | user     | password| sports | 

  And the following events exist:
    | title     |location   | start       | finish         | tags   | guid |
    | Free Food | Andy Kerr | TODAYS_DATE | TOMORROWS_DATE | sports | test1 |


  And I am logged in as "user" with password "password"
  And I am on the home page


#TODO: Figure out how to 
Scenario: upvote an event
 When I follow "Today"
 And I follow "upvote" for "Free Food"
 Then I should see "Free Food"
 And I should see "Free Food has been upvoted"


Scenario: downvote an event
 When I follow "Today"
 And I follow "downvote" for "Free Food"
 Then I should see "Free Food"
 And I should see "Free Food has been downvoted"


Scenario: un-upvote an event
 When I follow "Today"
 And I see "upvoted" for "Free Food"
 And I follow "upvoted" for "Free Food"
 Then I should see "upvote" for "Free Food"
 And I should see "downvote" for "Free Food"

Scenario: un-downvote an event
 When I follow "Today"
 And I see "downvoted" for "Free Food"
 And I follow "downvoted" for "Free Food"
 Then I should see "downvote" for "Free Food"
 And I should see "upvote" for "Free Food"


Scenario: switch from upvote to downvote
 When I follow "Today"
 And I see "upvoted" for "Free Food"
 And I follow "downvote" for "Free Food"
 Then I should see "Free Food has been downvoted"
 And I should see "upvote" for "Free Food"
 And I should see "downvoted" for "Free Food"

Scenario: switch from downvote to upvote
  When I follow "Today"
 And I see "downvoted" for "Free Food"
 And I follow "upvote" for "Free Food"
 Then I should see "Free Food has been upvoted"
  And I should see "downvote" for "Free Food"
  And I should see "upvoted" for "Free Food"
