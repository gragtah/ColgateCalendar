Feature: View Events in a Given Timerange

    As a student
    So that I can see what's coming up that I might want to attend
    I want to be able to view events in a given time range

Background: on the main page
    Given I am on the main page

Scenario: view today's events
    When I click "Today"
    Then I should be on the view events page
    And I should see "Today's events"

Scenario: view tomorrow's events
    When I click "Tomorrow"
    Then I should be on the view events page
    And I should see "Tomorrow's events"

Scenario: view this week's events
    When I click "This week"
    Then I should be on the view events page
    And I should see "This week's events"

