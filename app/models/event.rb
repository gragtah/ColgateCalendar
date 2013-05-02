require 'date'
require 'thumbs_up'
require 'will_paginate/array'
require 'will_paginate'
class Event < ActiveRecord::Base
  acts_as_voteable
  validates :guid, :uniqueness => {:scope => :start}
  attr_accessible :contact_link, :contact_name, :contact_phone, :description, :finish, :event_link, :guid, :location, :start, :tags, :title

  def self.fetch_and_save_events
    eventListJsonString = eat("http://calendar.colgate.edu/webcache/v1.0/jsonDays/7/list-json/no--filter/no--object.json")
    eventListJsonArray = (JSON.parse(eventListJsonString))["bwEventList"]["events"]
    eventListJsonArray.each do |event|
        newEvent = {}
        newEvent["title"]= event["summary"]
        newEvent["guid"]= event["guid"]
        newEvent["location"]= (event["location"]["address"]).gsub(/^z\*/,'')
#TODO: timezone issue, for events/tomorrow conversion UTC TO EDT
        newEvent["start"]= DateTime.parse(event["start"]["utcdate"]).in_time_zone("Eastern Time (US & Canada)").to_s
        newEvent["finish"]= DateTime.parse(event["end"]["utcdate"]).in_time_zone("Eastern Time (US & Canada)").to_s
        newEvent["event_link"]= event["eventlink"]
        newEvent["description"]= event["description"]
        newEvent["tags"]= event["categories"].join(',').downcase
        newEvent["contact_name"]= event["contact"]["name"]
        newEvent["contact_phone"]= event["contact"]["phone"]
        newEvent["contact_link"]= event["contact"]["link"]
        Event.create(newEvent)
    end
    eventListJsonArray.count
  end
  
  def self.get_events_after_filtering_by_tags(session, page, size, order = "")
    if session[:logged_in] == true 
        @username = session[:username]
        tags = User.find_by_username(@username).tags.downcase.split(',')

        #Following code adds tag filtering to our SQL query, and the placeholders for the tags' values
        if tags.length > 0
            @condition_array[0] << " AND (" << (["tags LIKE ?"] * tags.length).join(' OR ') << ")"
            @condition_array += (tags.map { |s| '%' + s.downcase + '%' })
        end
    end
    #due to the way paginate works with lazy loading and dynamic query formation,
    #this has to be one single statement.
    results = Event.all(:conditions => @condition_array, :order => order).map { 
        |event| 
            vote = nil
            vote_object = event.votes.where(:voter_id => session[:id]).first
            if vote_object != nil
                vote = vote_object.vote
            end
            if session[:admin] == true
                [event, vote, event.votes_for, event.votes_against]
            else
                [event, vote]
            end
    }.paginate(:per_page => size, :page => page)

  end

#TODO: make method that takes params as "events_today, events_tomorrow" etc
#and then case statements decide the condition array to pass to get_events... method
  def self.events_today(session, page = 1, size = 10) 
    @condition_array = ["start < ? AND finish > ?", DateTime.tomorrow.at_beginning_of_day, DateTime.now]
    get_events_after_filtering_by_tags(session, page, size) 
  end

  def self.events_tomorrow(session, page = 1, size = 10) 
    @condition_array = ["start < ? AND finish > ?", DateTime.tomorrow.tomorrow.at_beginning_of_day, DateTime.tomorrow.at_beginning_of_day]
    get_events_after_filtering_by_tags(session, page, size) 
  end

#fix this 
  def self.events_this_week(session, page = 1, size = 10) 
    @condition_array = ["start < ? AND finish > ?", (DateTime.now + 7).at_beginning_of_day, DateTime.now]
    get_events_after_filtering_by_tags(session, page, size) 
  end

#We are counting as past events all events which have a start time before the current time
#Especially note that ongoing events will be included in the past events even if they have a while
#before they end
  def self.events_past(session, page = 1, size = 10)
    @condition_array = ["start < ?", DateTime.now]
    order = "finish DESC"
    get_events_after_filtering_by_tags(session, page, size, order)
  end

end
