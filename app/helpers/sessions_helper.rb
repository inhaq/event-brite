module SessionsHelper
    def check_user_in_db
        @user_exists = User.find_by_email(params[:user][:email])
      end

      def login(user)
      cookies.permanent[:remember_token] = user[:remember_token]
      end
end
