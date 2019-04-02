module AttendeesHelper
    def single_invitation
        Event.singleEvent(@invitations)
    end
      
    def event_creator(a)
      User.find(a).email.split('@')[0].capitalize
    end
    
    def is_creator(a)
      user_iam.id == a.user_id 
    end
    
    def accepted
      accepted = Attendee.accepted_or_pending_event(params[:id],true)
      User.listUser(accepted)
    end
    
    def pending_invitation
      accepted = Attendee.accepted_or_pending_event(params[:id],false)
      User.listUser(accepted)
    end
end
