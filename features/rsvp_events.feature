Feature: RSVP to a given event

    As a student
    So that my friends can know where I'll be going
    I want to be able to RSVP to events

Background: on the home page
  
    And the following events exist:
       | title                     | location          | start           | finish            |   tags      | guid  |
       | Soccer game vs Bucknell   | Andy Kerr         | TODAYS_DATE     | TOMORROWS_DATE    |   Sports    | test1 |
       | Modern Art exhibition     | Dana Arts Center  | TOMORROWS_DATE  | TOMORROWS_DATE    |   Arts      | test2 |
       | Sound and Art             | Dana Arts Center  | YESTERDAYS_DATE | YESTERDAYS_DATE   |   Arts      | test3 |


Scenario: RSVP to an event
   Given I am a logged in user
   When I follow "Today"
   And I follow "Soccer game vs Bucknell"
   And I follow "RSVP"
   Then I should see "Soccer game vs Bucknell"
   And I should see "You are attending this event"

Scenario: UnRSVP to an event
    Given I am a logged in user
    When I follow "Today"
    And I follow "Soccer game vs Bucknell"
    Then I should see "You are attending this event"
    When I follow "RSVP"
    Then I should see "Soccer game vs Bucknell"
    And I should not see "You are attending this event"
