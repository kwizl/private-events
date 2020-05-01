class User < ApplicationRecord
  has_secure_password

  has_many :created_events, class_name: 'Event', foreign_key: 'user_id'
  has_many :attended_events, through: :attendee_event, foreign_key: 'attendee_id', class_name: 'Event'
end
