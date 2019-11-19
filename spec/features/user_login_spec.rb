require 'rails_helper'

RSpec.feature "User can logs in sucessfuly and gets sent to the homepage", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(first_name: 'Karen', last_name: 'user_name', email: 'user@mail.com', password: '1234567', password_confirmation: "1234567")
  end


  scenario "User logs in and gets sent to the home page" do
    visit '/login'
    fill_in 'email', with: 'user@mail.com'
    fill_in 'password', with: '1234567'
    click_on('Submit')
    expect(page).to have_content('Signed in as Karen')
    save_screenshot('user_login.png')
  end
end 
