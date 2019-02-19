class StaticsController < ApplicationController
  before_action :back_off, only: [:home]
  before_action :if_logged_in, only: [:show] 
  def show
  end
  def home
  end
end
