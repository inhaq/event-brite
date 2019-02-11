class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @n = get_uname
  end
  
  def create
    if check_user_in_db
      if cookies[:remember_token].nil?
        cookies.permanent[:remember_token] = @user_exists[:remember_token]
      end
    else
      @user = User.new(user_params)
      @user.save
      cookies.permanent[:remember_token] = @user[:remember_token]
    end
    redirect_to new_event_path
  end
  
  def logout
    cookies.delete :remember_token
    redirect_to ''
  end
  
 
  
  private
  
  def check_user_in_db
    @user_exists = User.find_by_email(params[:user][:email])
  end
  
  def user_params
    params.require(:user).permit(:email)
  end

  def get_uname
    @user = User.find(params[:id])
    name = @user.email.split('@')[0].capitalize
    end
end
