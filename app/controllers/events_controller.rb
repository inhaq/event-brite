class EventsController < ApplicationController

  def index
    # if he is the owner or he accepted the invitation
    @events = Event.where(user_id: user_iam.id)
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
    {user_id:@event.user_id,accepted:true, invitee: @event.user_id}
  end 

  def creator
    User.find(@event.user_id).email.split('@')[0].capitalize
  end
end
 

