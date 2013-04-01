require 'date'
class Event < ActiveRecord::Base
  validates :guid, :uniqueness => {:scope => :start}
  attr_accessible :contact_link, :contact_name, :contact_phone, :description, :end, :event_link, :guid, :location, :start, :tags, :title

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
        newEvent["end"]= DateTime.parse(event["end"]["utcdate"]).in_time_zone("Eastern Time (US & Canada)").to_s
        newEvent["event_link"]= event["eventlink"]
        newEvent["description"]= event["description"]
        newEvent["tags"]= event["categories"].join(',')
        newEvent["contact_name"]= event["contact"]["name"]
        newEvent["contact_phone"]= event["contact"]["phone"]
        newEvent["contact_link"]= event["contact"]["link"]
        Event.create(newEvent)
    end
  end
  
  def self.events_today
    @events = Event.find(:all, :conditions => ["start < ? AND end > ?", DateTime.tomorrow.at_beginning_of_day, DateTime.now]) 
  end

  def self.events_tomorrow
    @events = Event.find(:all, :conditions => ["start < ? AND end > ?", DateTime.tomorrow.tomorrow.at_beginning_of_day, DateTime.tomorrow.at_beginning_of_day]) 
  end

#fix this 
  def self.events_this_week
    @events = Event.find(:all, :conditions => ["start < ? AND end > ?", (DateTime.now + 7).at_beginning_of_day, DateTime.now]) 
  end

end
