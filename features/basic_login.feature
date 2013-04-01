Feature: Basic Login Functionality

    As a user
    So that I can have this app display content customized to my preferences
    I want to login using my Colgate credentials

    For this feature, in this iteration, we will just implement a simple user with username: "user" and password "password" so that hereon we work with non-logged-in and logged-in users very clearly.

Background: on login page
    Given I am on the login page

Scenario: login with correct credentials
    When I fill in "Username" with "user"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should be on the home page

Scenario: login with incorrect credentials
    When I fill in "Username" with "user"
    And I fill in "Password" with "notmypassword"
    And I press "Login"
    Then I should be on the login page
    And I should see "Invalid Credentials!"
