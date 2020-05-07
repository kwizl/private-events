class AttendeeEvent < ApplicationRecord
  belongs_to :attendee, class_name: 'User', foreign_key: 'user_id', inverse_of: :attendee_event
  belongs_to :event
end
