class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendee_events
  has_many :attendees, through: :attendee_events, class_name: 'User', foreign_key: 'user_id'
  scope :upcoming_events, -> { where('date > ?', Date.today.strftime("%Y-%m-%d")) }
  scope :previous_events, -> { where('date <= ?', Date.today.strftime("%Y-%m-%d")) }
end
