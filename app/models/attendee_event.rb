class AttendeeEvent < ApplicationRecord
  belongs_to :attendee, class_name: 'User', foreign_key: 'user_id', inverse_of: :attendee_events
  belongs_to :event, inverse_of: :attendee_events
end




#  class AttendeeEvent < ActiveRecord::Base
#   belongs_to :user, inverse_of: :attendee_events
#   belongs_to :event, inverse_of: :sentences
#  end

