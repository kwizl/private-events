require 'rails_helper'
require 'capybara/rails'

RSpec.describe "UserSessions", type: :request do
  describe 'the signin process', type: :feature do
    let(:user) { create(:user, name: 'jack', password: '12345') }

    scenario 'sets the user name in the session' do
      visit login_url
      within 'form' do
        fill_in "Name", with: user.name
      end
      click_button 'Login'
      expect(page.get_rack_session_key('name')).to eq("jack")
      page.instance_variable_set(:@touched, false)
    end

    scenario 'removes name key from session when logout' do
      visit logout_url
      expect { page.get_rack_session_key('name') }.to raise_error(KeyError)
    end
  end
end
