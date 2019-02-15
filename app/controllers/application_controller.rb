class ApplicationController < ActionController::Base
    include ApplicationHelper
    include UsersHelper
    include AttendeesHelper
    include EventsHelper
    before_action :back_off ,except: [:home,:login,:show]
end
