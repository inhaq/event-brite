module EventsHelper
    def upcoming_accepted_events
        accept = Attendee.accepted_or_pending_user(user_iam,true)
        Event.upcomingAccepted(accept)
    end
    
    def prev_accepted_events
        accept = Attendee.accepted_or_pending_user(user_iam,true)
        Event.prevAccepted(accept)
    end
    
    def prev_events
        @prev = @events.past(Time.now)
    end
    
    def upcoming_events
        @upcoming = @events.upcoming(Time.now)
    end
end
