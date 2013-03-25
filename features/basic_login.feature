Feature: Basic Login Functionality

    As a user
    So that I can have this app customized to my preferences
    I want to login using my Colgate credentials

    For this feature though we will just implement a basic user with username: "user" and password "password"

Background: on login page
    Given I am on the login page

Scenario: login with correct credentials
    When I fill in "Username" with "user"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should be on home page for "user"

Scenario: login with incorrect credentials
    When I fill in "Username" with "user"
    And I fill in "Password" with "notmypassword"
    And I press "Login"
    Then I should be on the login page
