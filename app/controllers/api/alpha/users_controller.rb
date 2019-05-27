class Api::Alpha::UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        users = User.all
        render json: users
    end
    
    def show
        user = User.find(params[:id])
        render json: user
    end
    
    def create
        user = User.create(user_params)
        # user.save
        render json: user
    end 
    def destroy
        user = User.find(params[:id])
        user.destroy
    end
    private
    def user_params
        params.require(:user).permit(:email)
    end

end