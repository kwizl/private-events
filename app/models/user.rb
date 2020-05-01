class User < ApplicationRecord
  has_secure_password

  has_many :created_events, class_name: 'Event', foreign_key: 'user_id'
  has_many :attendee_events
  has_many :attended_events, through: :attendee_events, source: :event, foreign_key: 'user_id'
end
