class UsersController < ApplicationController
  before_action :back_off, except: [:new,:create]
  before_action :only_you, only: [:show]
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
    redirect_to home_path
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

  def only_you
      a = User.find(params[:id])
    unless  a.id == user_iam.id
      flash[:danger] = 'Sorry not yours'
      redirect_to user_path(user_iam)
    end
  end
end
