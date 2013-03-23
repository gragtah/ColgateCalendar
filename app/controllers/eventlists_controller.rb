require 'json'
require 'eat'
class EventlistsController < ApplicationController
  # GET /eventlists
  # GET /eventlists.json
  def index
    @eventlists = Eventlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventlists }
    end
  end

  # GET /eventlists/1
  # GET /eventlists/1.json
  def show
    @eventlist = Eventlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @eventlist }
    end
  end

  # GET /eventlists/new
  # GET /eventlists/new.json
  def new
    @eventlist = Eventlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @eventlist }
    end
  end

  # GET /eventlists/1/edit
  def edit
    @eventlist = Eventlist.find(params[:id])
  end

  # POST /eventlists
  # POST /eventlists.json
  def create
    @eventlist = Eventlist.new(params[:eventlist])

    respond_to do |format|
      if @eventlist.save
        format.html { redirect_to @eventlist, notice: 'Eventlist was successfully created.' }
        format.json { render json: @eventlist, status: :created, location: @eventlist }
      else
        format.html { render action: "new" }
        format.json { render json: @eventlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eventlists/1
  # PUT /eventlists/1.json
  def update
    @eventlist = Eventlist.find(params[:id])

    respond_to do |format|
      if @eventlist.update_attributes(params[:eventlist])
        format.html { redirect_to @eventlist, notice: 'Eventlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @eventlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventlists/1
  # DELETE /eventlists/1.json
  def destroy
    @eventlist = Eventlist.find(params[:id])
    @eventlist.destroy

    respond_to do |format|
      format.html { redirect_to eventlists_url }
      format.json { head :no_content }
    end
  end
  
  def show_event_list
    x = eat("http://calendar.colgate.edu/webcache/v1.0/jsonDays/7/list-json/no--filter/no--object.json")
    @eventlistresult = JSON.parse(x)
  end
end


