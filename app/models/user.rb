require 'thumbs_up'
class User < ActiveRecord::Base
    devise :omniauthable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:google_oauth2]
    acts_as_voter
    attr_accessible :username, :password, :email, :tags
    
    def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
        data = access_token.info
        user = User.where(:email => data["email"]).first

        unless user
            user = User.create(username: data["name"],
                               email: data["email"],
                               password: Devise.friendly_token[0,20]
                               )
        end
        user
    end

    def correct_password?(pwd)
        self.password == pwd
    end
    
    def self.verify_credentials?(username, password)
        user = User.find_by_username(username)
        !user.nil? and user.correct_password?(password)
    end

   def update_tags(tags_list)
        chosen_tags = []
        tags_list ||= {"" => 1}
        tags_list.each do |tag|
            if tag.second == "1"
                chosen_tags << tag.first
            end
        end
       self.tags = chosen_tags.join(',').downcase
       self.save!
   end

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
