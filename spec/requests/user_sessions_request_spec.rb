require 'rails_helper'
require 'capybara/rails'

RSpec.describe "UserSessions", type: :request do
  before :each do
    User.create(name: 'Martin', password: '1234')
  end

  it 'signs me in' do
    visit '/login'
    within('#new') do
      fill_in 'Name', with: 'Mrtin'
      fill_in 'Password', with: '1234'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end
