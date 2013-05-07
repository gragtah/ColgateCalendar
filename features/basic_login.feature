Feature: Basic Login Functionality

    As a user
    So that I can have this app display content customized to my preferences
    I want to login using my Colgate credentials

Scenario: Logging in
    Given I am on the home page
    When I follow "Login"
    Then I should be on the signup page

Scenario: Logging out
#  Then I should be signed in with Google
    Given I am a logged in user
    And I am on the home page
    And I follow "Logout"
    Then I should see "logged out"
    And I should not see "Settings"



#
#    For this feature, in this iteration, we will just implement a simple user with username: "user" #and password "password" so that hereon we work with non-logged-in and logged-in users very clearly.
#
#Background: on login page
#    Given the following users exist:
#       | username  | password         |
#       | user      | password         |    
#    Given I am on the login page
#
#Scenario: login with correct credentials
#    When I fill in "Username" with "user"
#    And I fill in "Password" with "password"
#    And I press "Login"
#    Then I should be on the home page
#    And I should see "Welcome, user!"
#    And I should see "Logged in as user"
#    
#Scenario: login with incorrect username
#    When I fill in "Username" with "notmyusername"
#    And I fill in "Password" with "password"
#    And I press "Login"
#    Then I should be on the login page
#    And I should see "Invalid username/password!"   
#    
#Scenario: login with incorrect password
#    When I fill in "Username" with "user"
#    And I fill in "Password" with "notmypassword"
#    And I press "Login"
#    Then I should be on the login page
#    And I should see "Invalid username/password!"
#   
#Scenario: logout a logged-in user
#    When I am logged in as "user" with password "password"
#    And I am on the home page
#    And I follow "Logout"
#    Then I should be on the home page
#    And I should see "You have logged out successfully!"
