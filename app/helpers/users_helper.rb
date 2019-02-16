module UsersHelper
    def logged_in?
        User.find_by(remember_token: cookies[:remember_token])
    end
    
    def user
        User.find_by_remember_token(cookies[:remember_token])
    end
    def name
       user.email.split('@')[0].capitalize
    end 
    def pending_invitations_u
       Attendee.where(accepted:false,invitee:user.id).nil? ? 0 : Attendee.where(accepted:false,invitee:user.id)
    end
   
end
