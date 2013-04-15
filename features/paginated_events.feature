Feature: View Paginated Events

    As a user
    So that I don't have to scroll too much when browsing through events
    I want to be able to view paginated events

Background: on the home page
    Given the following events exist:
       | title                     | location          | start           | finish            |   tags      | guid  |
       | Soccer game vs Bucknell   | Andy Kerr         | TODAYS_DATE     | TOMORROWS_DATE    |   Sports    | test1 |
       | Modern Art exhibition     | Dana Arts Center  | TOMORROWS_DATE  | TOMORROWS_DATE    |   Arts      | test2 |
       | Sound and Art             | Dana Arts Center  | YESTERDAYS_DATE | YESTERDAYS_DATE   |   Arts      | test3 |

Scenario: view this week's events page 1 size 1
    When I am on the events page for week with page number 1 and size 1
    Then I should see "Soccer game vs Bucknell" 
    And I should not see "Modern Art exhibition" 

Scenario: view this week's events page 2 size 1
    When I am on the events page for week with page number 2 and size 1
    Then I should see "Modern Art exhibition" 
    Then I should not see "Soccer game vs Bucknell" 
