require 'rails_helper'
require 'capybara/rails'

RSpec.describe "UserSessions", type: :request do
  # before :each do
  #   User.create(name: 'Martin', password: '1234')
  # end

  # it 'signs me in' do
  #   visit '/login'
  #   within('#new') do
  #     fill_in 'Name', with: 'Mrtin'
  #     fill_in 'Password', with: '1234'
  #   end
  #   click_button 'Sign in'
  #   expect(page).to have_content 'Success'
  # end

  describe 'the signin process', type: :feature do
    # before :each do
      let (:user) { FactoryBot.build(:user) }
    # end

    scenario 'login page' do
      visit login_url
      within 'form' do
        fill_in "Name", with: user.name
      end
      click_button 'Login'
      expect(status_code).to eq 200
    end
  end
end
