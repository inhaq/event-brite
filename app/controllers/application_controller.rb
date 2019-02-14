class ApplicationController < ActionController::Base
    include ApplicationHelper
    include UsersHelper
    include AttendeesHelper
    include EventsHelper
end
