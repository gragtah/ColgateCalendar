Feature: View Events with Chosen Keywords

    As a student
    So that I only see events that I am interested in
    I want to be able to keep a list of keywords

Background: on the main page with keywords already chosen in settings
    Given the following users exist:
       | username  | password | tags        |  email          |
       | user      | password | art, sports | fake@colgate.edu|  
    Given I am logged in as "user" with password "password"
    And I am on the home page
    And the following events exist:
       | title                     | location          | start           | end            |   tags      | guid  |
       | Soccer game vs Bucknell   | Andy Kerr         | TODAYS_DATE     | TOMORROWS_DATE |   Sports    | test1 |
       | Modern Art exhibition     | Dana Arts Center  | TOMORROWS_DATE  | TOMORROWS_DATE |   Arts      | test2 |
       | Lecture on Number theory  | Ho Science Center | TODAYS_DATE     | TOMORROWS_DATE |   Academic  | test3 |
    And username "user" has set the following tags: Arts, Sports

Scenario: view events with chosen keywords
    When I follow "This Week"
    Then I should be on the events page for week
    And I should see "Soccer game vs Bucknell"
    And I should see "Modern Art exhibition"
    But I should not see "Lecture on Number theory"
