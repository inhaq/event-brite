class UsersController < ApplicationController
  before_action :logged_in?, only: [:new]
  before_action :from_login, only: [:new]
  before_action :only_you, only: [:show]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
    login @user
    redirect_to home_path
    else
      flash[:danger] = 'Please enter correct email.'
      render 'new'
    end
  end
    
  private
  def user_params
    params.require(:user).permit(:email)
  end
end
