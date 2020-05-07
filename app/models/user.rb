class User < ApplicationRecord
  has_secure_password

  has_many :created_events, class_name: 'Event', foreign_key: 'user_id', dependent: :destroy, inverse_of: :creator
  has_many :attendee_events, dependent: :destroy, inverse_of: :attendee
  has_many :attended_events, through: :attendee_events, source: :event, foreign_key: 'user_id'
end

# class User < ActiveRecord::Base
#   has_many :attendee_events, inverse_of: :user
#   has_many :attended_events, through: :attended_events
#  end