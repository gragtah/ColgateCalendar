require 'json'
require 'eat'
class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @logged_in = session[:logged_in]
    @username = session[:username]
  end

=begin
  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
=end

  def fetch_and_save_events
    @fetched_events_count = Event.fetch_and_save_events
    flash[:info] = "#{fetched_events_count} events stored in the database."
    render :fetch_and_save_events
  end

  def events_today
    @events = Event.events_today(session)
    @when = "Today"
    render :events_list
  end

  def events_tomorrow
    @events = Event.events_tomorrow(session)
    @when = "Tomorrow"
    render :events_list
  end
  
  def events_this_week
    @events = Event.events_this_week(session)
    @when = "This Week"
    render :events_list
  end

end

