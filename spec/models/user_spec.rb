require 'spec_helper'

describe User do
  describe 'find_for_google_oauth2' do
    it 'should find the user' do
        user = mock('User')
        access_token = mock()
        access_token.stub('info').and_return(:email => "a@test.com")
        User.should_receive('where').and_return([user])
        User.find_for_google_oauth2(access_token)
    end
  end
end
