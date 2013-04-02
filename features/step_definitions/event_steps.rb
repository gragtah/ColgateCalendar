# Declarative step for populating the DB with events.

Given /the following events exist/ do |events_table|
    events_table.map_column!('start') do |date| 
        if date == 'TODAYS_DATE'
            date = DateTime.now
        elsif date == 'TOMORROWS_DATE'
            date = DateTime.now.tomorrow 
        end
        date
    end
    events_table.map_column!('finish') do |date| 
        if date == 'TODAYS_DATE'
            date = DateTime.now 
        elsif date == 'TOMORROWS_DATE'
            date = DateTime.now.tomorrow 
        end
        date
    end
    events_table.hashes.each do |event|
        Event.create!(event)
    end
end
