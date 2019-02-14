module UsersHelper
    def logged_in?
        !cookies[:remember_token].nil?
    end
    
    def user
        User.find_by_remember_token(cookies[:remember_token])
    end
    def name
       user.email.split('@')[0].capitalize
    end 
    def pending_invitations
       Attendee.where(accepted:false,invitee:user.id)
    end
    # def pending_event
    #     n = Event.where(id:pending_invitations.event_id)
    #     @a[:event_id] = n.id 
    # end
end
