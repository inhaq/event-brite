module ApplicationHelper
    def user_iam
        User.find_by(remember_token: cookies[:remember_token])
    end

    def back_off
        if !logged_in?
            flash[:danger] = 'Sign In First'
            redirect_to root_path
        end
    end
end
