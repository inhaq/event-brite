class AttendeesController < ApplicationController
    before_action :back_off
    before_action :already ,only: [:create]
    def all_invitations
      @invitations = Attendee.where(invitee: user_iam.id,accepted:false)
    end
    
    def accept
      a = Attendee.find_by(invitee:user_iam.id,event_id:params[:format])
      a.update_attributes(accepted: true )
      flash[:success] = 'Good decision'
      redirect_to invitations_path
    end
    
    def destroy
     a = Event.find(params[:event_id])
     c = a.attendees.find_by(invitee:user_iam.id)
     c.destroy
     flash[:danger] = "You'll be sorry"
     redirect_to invitations_path
    end
    
    def create
        invited_user = User.find_by_email(params[:attendee][:email])
        @current_event = Event.find(params[:event_id])
        if invited_user
          @current_event.attendees.build(invitee: invited_user.id, user_id: user_iam.id).save
          flash[:success] = 'Well done! Now wait for accepting this invitation 😀'
         return redirect_to event_path(@current_event)
        end
          flash[:danger] = 'Typo? Wrong email? Or Mad?'
          redirect_to event_path(@current_event)
    end 
    private
    
    def already
      n = Event.find(params[:event_id])
      u = User.find_by_email(params[:attendee][:email])
      return true if u.nil?
      l = n.attendees.find_by(invitee:u.id)
      if l 
        flash[:danger] = 'User has been invited already'
        redirect_to event_path(n)
      end
    end 
end
