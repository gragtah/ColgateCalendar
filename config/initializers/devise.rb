Devise.setup do |config|
    require "omniauth-google-oauth2"
    config.omniauth :google_oauth2, "419846013672.apps.googleusercontent.com", "WKUN0j0YC2inP7VyHKxI1C_T", { access_type: "offline", approval_prompt: "" }
      require 'devise/orm/active_record'

end
