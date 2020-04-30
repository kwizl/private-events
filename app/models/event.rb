class Event < ApplicationRecord
  belongs_to :user, class_name: 'creator', foreign_key: 'user_id'
end
