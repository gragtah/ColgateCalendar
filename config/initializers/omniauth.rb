Rails.application.config.middleware.use OmniAuth::Builder do
    client_id = "1036105614021.apps.googleusercontent.com"
    client_secret = "8drPy7opb7Uo9Su-j4Nq9C9o"
    provider :google_oauth2, client_id, client_secret, {:approval_prompt => 'auto'}
end

OmniAuth.config.on_failure = UsersController.action(:oauth_failure)
