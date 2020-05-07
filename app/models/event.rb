class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :created_events
  has_many :attendee_events, dependent: :destroy, inverse_of: :event
  has_many :attendees, through: :attendee_events, class_name: 'User', foreign_key: 'user_id', inverse_of: :event_id
  scope :upcoming_events, -> { where('date > ?', Time.zone.today.strftime('%Y-%m-%d')) }
  scope :previous_events, -> { where('date <= ?', Time.zone.today.strftime('%Y-%m-%d')) }
end


# class Event < ActiveRecord::Base
#   has_many :attendee_events, inverse_of: :event
#   has_many :users, through: :attended_events
#  end