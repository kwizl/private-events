require 'rails_helper'

RSpec.describe Event, type: :model do
  context "Event Associations" do
    it { should belong_to(:creator).without_validating_presence }
    it { should have_many(:attendee_events).without_validating_presence }
    it { should have_many(:attendees).without_validating_presence }
  end
  context "Validation tests" do
    let(:user) { create(:user) }
    it 'should save event' do
      events = user.created_events.build
      expect(events.save).to be(true)
    end
  end
end
