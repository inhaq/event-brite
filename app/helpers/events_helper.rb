module EventsHelper
    def upcoming_accepted_events
        @upcoming_accepted = []
        accept = Attendee.where(invitee: user_iam.id, accepted: true)
        event_ids = []
        accept.each do |a| 
            event_ids << a.event_id
        end
        @upcoming_accepted = Event.where(id: event_ids, date: Time.now..DateTime::Infinity.new).order(:date)
    end
    
    def prev_accepted_events
        @prev_accepted = []
        accept = Attendee.where(invitee: user_iam.id, accepted: true)
        event_ids = []
        accept.each do |a| 
            event_ids << a.event_id
        end
        
        @prev_accepted = Event.where(id: event_ids, date: Time.new(10, 1, 1, 0, 0, 0)..Time.now).order(:date)
    end
    
    def prev_events
        @prev = @events.past(Time.now)
    end
    
    def upcoming_events
        @upcoming = @events.upcoming(Time.now)
    end
end
