class AttendeeEvent < ApplicationRecord
  belongs_to :attendee, class_name: 'User', foreign_key: 'user_id', inverse_of: :attended_events
  belongs_to :event
end
