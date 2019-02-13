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
end
