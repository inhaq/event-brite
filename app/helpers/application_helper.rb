module ApplicationHelper
    def user_iam
        User.find_by(remember_token: cookies[:remember_token])
    end
end
