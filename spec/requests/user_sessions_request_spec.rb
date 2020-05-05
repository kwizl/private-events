require 'rails_helper'
require 'capybara/rails'

RSpec.describe "UserSessions", type: :request do
  describe 'the signin process', type: :feature do
    let (:user) { FactoryBot.build(:user) }

    scenario 'login page' do
      visit login_url
      within 'form' do
        fill_in "Name", with: user.name
      end
      click_button 'Login'
      expect(status_code).to eq 200
    end

    scenario 'logout' do
      visit logout_url
      expect(status_code).to eq 200
    end
  end
end
