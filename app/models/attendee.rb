class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.accepted_or_pending_event(event,yes_no)
    Attendee.where(event_id: event).where(accepted: yes_no)
  end

  def self.accepted_or_pending_user(user,yes_no)
    Attendee.where(invitee: user.id).where(accepted: yes_no)
  end
end
