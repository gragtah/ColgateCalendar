# Declarative step for populating the DB with events.

Given /the following events exist/ do |events_table|
    events_table.map_column!('start date') do |date| 
        if date == 'TODAYS_DATE'
            date = Time.now.strftime("%Y-%m-%d")
        end
        date
    end
    events_table.hashes.each do |event|
        Event.create!(event)
    end
end
