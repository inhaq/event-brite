class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
  def show
    @event = Event.find(params[:id])
    @creator = creator
  end
  
  def create
    puts "--------------------------#{user_iam.id}" 
    @event = user_iam.events.build(event_params)
    puts "--------------------------#{@event}" 
    @event.save
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :date)
  end

  def creator
    User.find(@event.user_id).email.split('@')[0].capitalize
  end
end
 

