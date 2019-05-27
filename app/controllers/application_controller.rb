class ApplicationController < ActionController::Base
    include ApplicationHelper
    include UsersHelper
    include AttendeesHelper
    include EventsHelper
    include SessionsHelper
    #before_action :back_off ,except: [:home,:login,:show]
    # skip_before_filter :verify_authenticity_token
    before_action :set_cache_buster
    protected

    def set_cache_buster
        response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "#{1.year.ago}"
    end
end
