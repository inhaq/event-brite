module EventsHelper
    def upcoming_accepted_events
        @upcoming_accepted = []
        accept = Attendee.where(invitee: user_iam.id, accepted: true)
        accept.each do |a| 
            @upcoming_accepted = Event.where(id: a.event_id).where("date > ?", Time.now)
        end
        @upcoming_accepted
    end
    
    def prev_accepted_events
        @prev_accepted = []
        accept = Attendee.where(invitee: user_iam.id, accepted: true)
        accept.each do |a| 
            @prev_accepted = Event.where(id: a.event_id).where("date < ?", Time.now)
        end
        puts @prev_accepted
        @prev_accepted
    end
    
    def prev_events
        @prev = []
        @events.each do |e|
            if e.date < Time.now
                @prev << e
            end
        end
        @prev
    end
    
    def upcoming_events
        @upcoming = []
        @events.each do |e|
            if e.date >= Time.now
                @upcoming << e
            end
        end
        @upcoming
    end
end
