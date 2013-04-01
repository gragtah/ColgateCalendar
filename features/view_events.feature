Feature: View Events in a Given Timerange

    As a student
    So that I can see what's coming up that I might want to attend
    I want to be able to view events in a given time range

Background: on the home page
    Given I am on the home page
    And the following events exist:
       | title                     | location          | start           | end            |   tags      | guid  |
       | Soccer game vs Bucknell   | Andy Kerr         | TODAYS_DATE     | TOMORROWS_DATE |   Sports    | test1 |
       | Modern Art exhibition     | Dana Arts Center  | TOMORROWS_DATE  | TOMORROWS_DATE |   Arts      | test2 |

Scenario: view today's events
    When I follow "Today"
    Then I should be on the events page for today
    And I should see "Soccer game vs Bucknell" 
    And I should not see "Modern Art exhibition" 

Scenario: view tomorrow's events
    When I follow "Tomorrow"
    Then I should be on the events page for tomorrow
    And I should see "Modern Art exhibition" 
    And I should see "Soccer game vs Bucknell" 

Scenario: view this week's events
    When I follow "This Week"
    Then I should be on the events page for week
    And I should see "Soccer game vs Bucknell" 
    And I should see "Modern Art exhibition" 

Scenario: fetching events from web feed and viewing entire list
    When I go to the page that activates event-fetching 
    Then I should see "events fetched." 
    And I follow "View Listing of All Events"
    And I should see "events stored in database."

