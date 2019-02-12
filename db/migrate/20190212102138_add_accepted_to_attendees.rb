class AddAcceptedToAttendees < ActiveRecord::Migration[5.2]
  def change
    add_column :attendees, :accepted, :boolean,default: false
  end
end
