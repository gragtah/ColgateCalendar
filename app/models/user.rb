require 'thumbs_up'
class User < ActiveRecord::Base
    acts_as_voter
    attr_accessible :username, :password, :email, :tags
    

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

  def upvote(event_id)
   event = Event.find(event_id)
   self.unvote_for(event) if self.voted_against?(event) == true 
   self.vote_for(event)
  end

  def downvote(event_id)
   event = Event.find(event_id)
   self.unvote_for(event) if self.voted_for?(event) == true 
   self.vote_against(event)
  end
  
  def unvote(event_id)
   event = Event.find(event_id)
   self.unvote_for(event)
  end
 
end
