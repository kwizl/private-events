require 'rails_helper'
require 'capybara/rails'
RSpec.describe 'the signin process', type: :feature do
  before :each do
    User.make(email: 'user@example.com', password: 'password')
  end

  it 'signs me in' do
    visit '/login'
    within('#new') do
      fill_in 'Name', with: 'abdel'
      fill_in 'Password', with: '12345'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end