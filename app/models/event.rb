class Event < ActiveRecord::Base
  attr_accessible :contact_link, :contact_name, :contact_phone, :description, :end, :event_link, :guid, :location, :start, :tags, :title
end
