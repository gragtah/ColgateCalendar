# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

     when /^the (ColgateCalendar )?home page$/ then '/'
     when /^the events page for (.*) with page number (.*) and size (.*)$/ then "/events/#{$1}?page=#{$2}&size=#{$3}"
     when /^the events page for (.*)$/ then "/events/#{$1}"
     when /^the page that activates event-fetching$/ then '/fetch_and_save_events'
     when /^the events listing page$/ then "/events"
     when /^the login page$/ then '/user/login'
     when /^the signup page$/ then '/users/sign_up'
     when /^the settings page for user with id (.*)$/ then "/user/#{$1}/settings"
     

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
