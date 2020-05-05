require 'rails_helper'

RSpec.describe AttendeeEvent, type: :model do
  describe "AttendeeEvent Associations" do
    it { should belong_to(:attendee).without_validating_presence }
    it { should belong_to(:event).without_validating_presence }
  end
end
