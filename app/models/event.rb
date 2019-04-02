class Event < ApplicationRecord
  belongs_to :user
  #has_many :users  #, foreign_key: :id
  has_many :attendees, dependent: :destroy
  validates :date, presence: true
  validates :title, presence: true
  scope :past, ->(time) { where("date < ?", time).reorder(date: :desc) }
  scope :upcoming, ->(time) { where("date > ?", time) }
  
  def self.singleEvent(invitations)
    Event.where(id: invitations.collect(&:event_id))
  end
  def self.upcomingAccepted(invitations)
    Event.where(id: invitations.collect(&:event_id)).where("date > ?",Time.now)
  end
  def self.prevAccepted(invitations)
    Event.where(id: invitations.collect(&:event_id)).where("date < ?",Time.now)
  end
end
