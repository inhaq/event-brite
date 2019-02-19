module ApplicationHelper
    def user_iam
        User.find_by(remember_token: cookies[:remember_token])
    end

    def back_off
        if !user_iam
            flash[:danger] = 'Sign In First'
            redirect_to login_path
        end
    end
    def if_logged_in
        if user_iam
            redirect_to home_path
        end
    end
end
