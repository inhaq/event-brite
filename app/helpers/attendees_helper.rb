module AttendeesHelper
    def single_invitation
      @a = []
      @invitations.each do |i|
        @a << Event.find(i.event_id)
      end
      @a
    end
      
    def event_creator(a)
      User.find(a).email.split('@')[0].capitalize
    end
    
    def is_creator(a)
      user_iam.id == a.user_id 
    end
    
    def accepted
      @event = Event.find(params[:id])
      accepted = Attendee.where(event_id: @event.id, accepted: true)
      acp_arr = []
      accepted.each do |acp|
        acp_arr << User.find(acp.invitee)
      end
      acp_arr
    end
    
    def pending_invitation
      pending = Attendee.where(event_id: @event.id, accepted: false)
      acp_arr = []
      pending.each do |acp|
        acp_arr << User.find(acp.invitee)
      end
      acp_arr
    end
end
