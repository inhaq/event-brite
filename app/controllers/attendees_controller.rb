class AttendeesController < ApplicationController
    
    def index
        @event_owner = Event.find(params[:id])
        @hello = @event_owner.attendees.where(invitee: user_iam.id)
    end
    def all_invitations
      @invitations = Attendee.where(invitee: user_iam.id,accepted:false)
    end
    
    def accept
      a = Attendee.where(invitee:user_iam.id,event_id:params[:format])
      a[0].update_attributes(accepted: true)
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
