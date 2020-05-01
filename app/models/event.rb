class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendee_events
  has_many :attendees, through: :attendee_events, class_name: 'User', foreign_key: 'user_id'
end
