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
        newEvent["location"]= event["location"]["address"]
        newEvent["start"]= DateTime.parse(event["start"]["utcdate"]).in_time_zone("Eastern Time (US & Canada)")
        newEvent["end"]= DateTime.parse(event["end"]["utcdate"]).in_time_zone("Eastern Time (US & Canada)")
        newEvent["event_link"]= event["eventlink"]
        newEvent["description"]= event["description"]
        newEvent["tags"]= event["categories"].join(',')
        newEvent["contact_name"]= event["contact"]["name"]
        newEvent["contact_phone"]= event["contact"]["phone"]
        newEvent["contact_link"]= event["contact"]["link"]
        Event.create(newEvent)
    end
  end
end
