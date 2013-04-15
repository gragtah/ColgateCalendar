Feature: Leave Rating for Events
    As a student
    So that event hosts have a sense of how I felt about their event
    I want to be able to rate events with an upvote or downvote

Background: Events exist with downvotes and upvotes
  
  Given the following users exist:
    | username | password|
    | user | password|

  And the following events exist:
    | title     |location   | start       | finish         | tags   | guid |
    | Free Food | Andy Kerr | TODAYS_DATE | TOMORROWS_DATE | sports | test1 |


  And I am logged in as "user" with password "password"
#The Following line does not work for this feature altghtough it has for previous ones....
  And I am on the events page for week


# We need to figure out how to associate checkboxes with given events 

Scenario: upvote an event
  Given "upvote" for "Free Food" is not checked
  And "downvote" for "Free Food" is not checked
  When I check "upvote" for "Free Food"
  Then "upvote" for "Free Food" should be checked
  And "downvote" for "Free Food" should not be checked

Scenario: downvote an event
  Given "upvote" for "Free Food" is not checked
  And "downvote" for "Free Food" is not checked
  When I check "downvote" for "Free Food"
  Then "downvote" for "Free Food" should be checked
  And "upvote" for "Free Food" should not be checked


Scenario: un-upvote an event
    Given "upvote" for "Free Food" is checked
    When I uncheck "upvote" for "Free Food"
    Then "upvote" for "Free Food" should not be checked
    And "downvote" for "Free Food" should not be checked

Scenario: un-downvote an event
    Given "downvote" for "Free Food" is checked
    When I uncheck "downvote" for "Free Food"
    Then "downvote" for "Free Food" should not be checked
    And "upvote" for "Free Food" should not be checked


Scenario: switch from upvote to downvote
    Given "upvote" for "Free Food" is checked
    When I check "downvote" for "Free Food"
    Then "downvote" for "Free Food" should be checked
    And "upvote" for "Free Food" should not be checked

 Scenario: switch from downvote to upvote
    Given "downvote" for "Free Food" is checked
    When I check "upvote" for "Free Food"
    Then "upvote" for "Free Food" should be checked
    And "downvote" for "Free Food" should not be checked

