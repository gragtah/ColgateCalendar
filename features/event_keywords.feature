Feature: View Events with Chosen Keywords
    
    As a student
    So that I only see events that I am interested in
    I want to be able to keep a list of keywords

Background: on the main page with keywords already chosen in settings
  
    Given the following events exist:
       | title                     | location          | start           | finish            |   tags      | guid  |
       | Soccer game vs Bucknell   | Andy Kerr         | TODAYS_DATE     | TOMORROWS_DATE |   sports    | test1 |
       | Modern Art exhibition     | Dana Arts Center  | TOMORROWS_DATE  | TOMORROWS_DATE |   arts      | test2 |
       | Lecture on Number theory  | Ho Science Center | TODAYS_DATE     | TOMORROWS_DATE |   academic  | test3 |
    And the following users exist:
      |id | username   | password         |   email       | 
      |777|  user      | password         |  test@test.com|  
    And I am a logged in user
    And username with email "test@test.com" has set the following tags: Arts, Sports
    And I am on the home page

Scenario: view events with chosen keywords
    When I follow "This Week"
    Then I should be on the events page for week
    And I should see "Soccer game vs Bucknell"
    And I should see "Modern Art exhibition"
    But I should not see "Lecture on Number theory"

Scenario: edit my keywords from settings
    Given I am on the home page
    And I follow "Settings"
    Then I should see "Choose your tags"
    When I check "Faculty"
    And I press "Save"
    Then I should be on the settings page for user with id 1
    And I should see "Settings updated"
