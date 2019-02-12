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
        Attendee.where(accepted:false,user_id:user.id).first
    end
    def pending_event
        Event.where(id:pending_invitations.event_id)
    end
end
