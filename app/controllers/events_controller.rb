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
    @event = user_iam.events.build(event_params)
    if @event.save
      @event.attendees.build(attendee_params).save
      redirect_to events_path
    else
      render 'new'
    end
  end
  
  
    private
  
  def event_params
    params.require(:event).permit(:title, :date)
  end
  
  def attendee_params
    {user_id:@event.user_id,accepted:true}
  end 

  def creator
    User.find(@event.user_id).email.split('@')[0].capitalize
  end
end
 

