class User < ActiveRecord::Base
    attr_accessible :username, :password, :email, :tags
    

#Needs updates. Needs to check session for a login boolean, for now this is a bogus method
    def self.authenticated?(username, password)
        user = find_by_username(username)
        if user.nil?
            false
        elsif user.has_password?(password)
            true
        else
            false
        end
    end


    def correct_password?(pwd)
        if pwd == @password
            true
        else
            false
	end
    end
end
