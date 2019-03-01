module UsersHelper
    def logged_in?
        !approved.nil?
    end
    def user
        User.find_by_remember_token(cookies[:remember_token])
    end
    def approved
        User.find_by(remember_token: cookies[:remember_token])
    end

    def name
       user.email.split('@')[0].capitalize
    end 
    def pending_invitations_u
       Attendee.where(accepted:false,invitee:user.id).nil? ? 0 : Attendee.where(accepted:false,invitee:user.id)
    end

    def get_uname
        @user = User.find(params[:id])
        name = @user.email.split('@')[0].capitalize
      end
    
      def only_you
          a = User.find(params[:id])
        unless  a.id == user_iam.id
          flash[:danger] = 'Sorry not yours'
          redirect_to user_path(user_iam)
        end
      end
     
    
   
end
