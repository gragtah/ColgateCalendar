require 'thumbs_up'
class User < ActiveRecord::Base
    attr_accessible :username, :password, :email, :tags
    acts_as_voter
    

#Needs updates. Needs to check session for a login boolean, for now this is a bogus method

    def correct_password?(pwd)
        self.password == pwd
    end
    
    def self.verify_credentials?(username, password)
        user = User.find_by_username(username)
        !user.nil? and user.correct_password?(password)
    end

#   def update_tags
#       return true
#    end

#   def upvote(event)
#   	user = User.find_by_username(username)
#   	user.vote_for(event)
#   end
#  def downvote(event)
#   	user = User.find_by_username(username)
#   	user.vote_against(event)
#   end
#   def self.upvote(event_id)
#    event = Event.find(event_id)
#    user = User.find_by_username("user") #session[:username])
#    user.vote_against(event)
#    end
end
