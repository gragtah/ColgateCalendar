ColgateCalendar
===============

There exists a need for a mobile-oriented web app, such as the ones on the Colgate mobile site (http://m.colgate.edu), 
that allows Colgate students to look up events on campus on the same day or the new future in as few steps as possible. The 
presented list of events should also be tailored to every individual student's preferences. Currently, the campus distributions 
email that is sent out to students twice a week is very long and students usually ignore it or don't remember the events 
that are listed for later in the week. Furthermore, the Calendar app on the Colgate mobile site doesn't have sorting or 
filtering options, and hence it isn't optimal for use by students. The information overload is a reason why students are 
driven away from the emails and the app.
   
This web app aims to alleviate these issues and meet this need for delivering non-intrusive, customized event data 
to people at Colgate. It is geared towards smartphone-users, mostly Colgate students, and presents a list of filtered 
events sorted by date and time in a user-friendly format. The main page allows quick navigation to events for the current 
day, events for the next day, events for the entire week, past events, and customizable filter settings. The filters are 
unique to each student and can be changed at any time to reflect their preferences - athletic events, guest lectures, 
film screenings etc. The stakeholders for ColgateCalendar are Fouad Saleet (our client), Saleet's Elites (Gaurav, Slava, 
Zach, Jack and Andrew), and Colgate students, faculty and professors.

CURRENT HEROKU APP URL:
http://secure-shore-2211.herokuapp.com/

NB:
- call the fetch and save events route to update stored events
- To get the list of all tags that is then used in config/environment.rb: 
    From rails console
    x = Event.uniq.pluck(:tags)
    y = []
    x.each do |taglist|
        y += taglist.downcase.split(',')
    end
    y.uniq
