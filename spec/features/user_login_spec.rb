require 'rails_helper'

RSpec.feature "User Login", type: :feature do
  before(:each) do 
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:spotify] 
  end

  it "can sign in with Spotify account" do
    visit root_path
    expect(page).to have_button('Login')
    expect(page).to have_content('Authenticate via spotify to get started.')
    click_button 'Login'

    expect(page).to have_content('Name: Harsh Singh')
    expect(page).to have_content('Email: harshs08@gmail.com')
    expect(page).to have_link('Open Spotify', href: 'https://open.spotify.com/user/1111111111')
  end
end
