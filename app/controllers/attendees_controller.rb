class AttendeesController < ApplicationController
    
    def index
        user.attendees.all
    end
    def create
        user = User.find_by_email(params[:attendee][:email])
        event = Event.find(params[:event_id])
        if user
          event.attendees.build(user_id:user.id).save
        else
          flash.now[:danger] = 'No such User'
          redirect_to event_path(event)
        end
    end 
end
