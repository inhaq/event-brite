module UsersHelper
    def logged_in?
        !user_iam.nil?
    end
    def name
       user_iam.email.split('@')[0].capitalize
    end 
    def pending_invitations_u
       Attendee.where(accepted:false,invitee:user_iam.id).nil? ? 0 : Attendee.where(accepted:false,invitee:user_iam.id)
    end
    
    def only_you
      a = User.find(params[:id])
      unless  a.id == user_iam.id
      flash[:danger] = 'Sorry not yours'
      redirect_to user_path(user_iam)
      end
    end
     
    
   
end
