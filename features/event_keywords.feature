Feature: View Events with Chosen Keywords

    As a student
    So that I only see events that I am interested in
    I want to be able to keep a list of keywords

Background: on the main page with keywords already chosen in settings
    Given I am on the main page
    And the following events exist:
       | Event name                | location          | start_date   |    keywords  |
       | Soccer game vs Bucknell   | Andy Kerr         | TODAYS_DATE  |    Sports    |
       | Modern Art exhibition     | Dana Arts Center  | TODAYS_DATE  |    Arts      |
       | Lecture on Number theory  | Ho Science Center | TODAYS_DATE  |    Academic  |
    And I have the following chosen keywords: 'Arts', 'Sports'

Scenario: view events with chosen keywords
    When I click "Today"
    Then I should be on the events page for Today
    And I should see the following events: "Soccer Game vs Bucknell", "Modern Art exhibition"
    But I should not see the following events: "Lecture on Number theory"
