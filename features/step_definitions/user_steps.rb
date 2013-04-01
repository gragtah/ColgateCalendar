# Declarative step for populating the DB with users.

Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        User.create!(user)
    end
end

Given /^I am logged in as "(.+)" with password "(.+)"$/ do |username, password|
    step %{I am on the login page}
    step %{I fill in "Username" with "#{username}"}
    step %{I fill in "Password" with "#{password}"}
    step %{I press "Login"}
end
