class EventsController < ApplicationController
  def index
    @events = Event.all(:order => 'occur_at desc')
  end

  def feed
    @events = Event.all(:order => 'occur_at desc',
                         :limit => 15)
    headers["Content-Type"] = "application/rss+xml"
    render :layout => false

  end
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to @event
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to @event
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to events_url
  end
end
