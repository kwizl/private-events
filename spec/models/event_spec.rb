require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Event Associations" do
    it { should belong_to(:creator).without_validating_presence }
    it { should have_many(:attendee_events).without_validating_presence }
    it { should have_many(:attendees).without_validating_presence }
  end
end
