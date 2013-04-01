Feature: View Events with Chosen Keywords

    As a student
    So that I only see events that I am interested in
    I want to be able to keep a list of keywords

Background: on the main page with keywords already chosen in settings
    Given I am on the home page
    And the following events exist:
       | title                     | location          | start           | end            |   tags      | guid  |
       | Soccer game vs Bucknell   | Andy Kerr         | TODAYS_DATE     | TOMORROWS_DATE |   Sports    | test1 |
       | Modern Art exhibition     | Dana Arts Center  | TOMORROWS_DATE  | TOMORROWS_DATE |   Arts      | test2 |
    And I have the following chosen keywords: 'Arts', 'Sports'

Scenario: view events with chosen keywords
    When I follow "Today"
    Then I should be on the events page for Today
    And I should see the following events: "Soccer Game vs Bucknell", "Modern Art exhibition"
    But I should not see the following events: "Lecture on Number theory"
