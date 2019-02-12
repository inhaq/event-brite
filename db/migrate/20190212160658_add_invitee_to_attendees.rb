class AddInviteeToAttendees < ActiveRecord::Migration[5.2]
  def change
    add_column :attendees, :invitee, :integer
  end
end
