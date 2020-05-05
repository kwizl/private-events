require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  describe 'the signin process' do
    let (:user) { FactoryBot.build(:user) }

    scenario 'login page' do
      visit login_url
      within '#new' do
        fill_in 'Name', with: 'John'
      end
      click_button 'Sign in'
      expect(page).to have_content 'Success'
    end
  end
end
