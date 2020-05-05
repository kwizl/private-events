require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Associations" do
    it { should have_many(:created_events).without_validating_presence }
    it { should have_many(:attendee_events).without_validating_presence }
    it { should have_many(:attended_events).without_validating_presence }
  end
end
