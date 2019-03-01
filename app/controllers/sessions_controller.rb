class SessionsController < ApplicationController

    def new
    end
    
    def create
        @user = User.find_by(email: params['/login'][:email])
        if !@user
            flash[:danger] = 'You are not registered user. Please enter your email to sign up.'
            redirect_to new_user_path
        else
            login(@user)
            redirect_to home_path
        end
    end

    def destroy
        cookies.delete :remember_token
        redirect_to home_path
    end

end
