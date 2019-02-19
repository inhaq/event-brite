class Event < ApplicationRecord
  belongs_to :user
  #has_many :users  #, foreign_key: :id
  has_many :attendees, dependent: :destroy
  validates :date, presence: true
  validates :title, presence: true
  scope :past, ->(time) { where("date < ?", time).reorder(date: :desc) }
  scope :upcoming, ->(time) { where("date > ?", time) }
end
