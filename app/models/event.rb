class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :created_events
  has_many :attendee_events, dependent: :destroy
  has_many :attendees, through: :attendee_events, class_name: 'User', foreign_key: 'user_id'
  scope :upcoming_events, -> { where('date > ?', Time.zone.today.strftime('%Y-%m-%d')).order(date: :asc) }
  scope :past_events, -> { where('date <= ?', Time.zone.today.strftime('%Y-%m-%d')).order(date: :desc) }
end
