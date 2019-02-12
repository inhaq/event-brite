class AttendeesController < ApplicationController
    
    def index
        @event_owner = User.find_by(params[:event_id])
        @hello = @event_owner.attendees.where(invitee: user_iam.id)
    end
    def create
        invited_user = User.find_by_email(params[:attendee][:email])
        @current_event = Event.find(params[:event_id])
        puts "---------------#{invited_user}-----------"
        if invited_user
          @current_event.attendees.build(invitee: invited_user.id, user_id: user_iam.id).save
        else
          flash.now[:danger] = 'No such User'
          redirect_to event_path(event)
        end
    end 
end
