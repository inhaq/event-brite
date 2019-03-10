class StaticsController < ApplicationController
  before_action :back_off, only: [:home]
  before_action :logged_in?, only: [:show] 
  def show
  end
  def home
  end
end
