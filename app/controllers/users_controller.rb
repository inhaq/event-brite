class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    if check_user_in_db
      if cookies[:remember_token].nil?
        cookies.permanent[:remember_token] = @user_exists[:remember_token]
      end
      show
    else
      @user = User.new(user_params)
      @user.save
      cookies.permanent[:remember_token] = @user[:remember_token]
      redirect_to ''
    end
  end
  
  def logout
    cookies.delete :remember_token
    redirect_to ''
  end
  
  def show
    puts 'hello------------'
  end
  
  private
  
  def check_user_in_db
    @user_exists = User.find_by_email(params[:user][:email])
  end
  
  def user_params
    params.require(:user).permit(:email)
  end
end
