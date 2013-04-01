class User < ActiveRecord::Base
    attr_accessible :username, :password, :email, :tags
    

#Needs updates. Needs to check session for a login boolean, for now this is a bogus method

    def correct_password?(pwd)
        self.password == pwd
    end
    
    def self.verify_credentials?(username, password)
        user = User.find_by_username(username)
        !user.nil? and user.correct_password?(password)
    end
end
