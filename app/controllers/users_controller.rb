class UsersController < ApplicationController
  before_action :if_logged_in, only: [:new]
  before_action :from_login, only: [:new]
  before_action :only_you, only: [:show]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @n = get_uname
  end
  
  def create
    # if check_user_in_db
    #   if cookies[:remember_token] != @user_exists[:remember_token]
    #     login @user_exists
    #   end
    # else
    @user = User.new(user_params)
    
    if @user.save
    login @user
    redirect_to home_path
    else
      flash[:danger] = 'Please enter correct email.'
      render 'new'
    end
    # redirect_to home_path
  end
  
  # def logout
  #   cookies.delete :remember_token
  #   redirect_to ''
  # end
  
 
  
  private
  def user_params
    params.require(:user).permit(:email)
  end
end
