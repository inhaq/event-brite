class EventsController < ApplicationController

  def new
    @event = Event.new
  end
  def create
    g
    @event = user_iam.events.build(event_params)
    @event.save
  end
  
  def g
    Time.now
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :date)
  end
end
