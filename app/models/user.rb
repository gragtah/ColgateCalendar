class User < ActiveRecord::Base
    attr_accessible :username, :password, :email, :tags
    
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
end
