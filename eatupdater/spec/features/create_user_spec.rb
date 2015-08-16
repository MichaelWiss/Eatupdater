require 'spec_helper'

describe "Creating a new user" do
  it "saves the user and shows the user's profile page" do
    visit root_url

    click_link 'Sign Up'

    expect(current_path).to eq(signup_path)

    fill_in "Name",  with: "Larry"
    fill_in "Email", with: "larry@example.com"
    fill_in "Password", with: "abracadabra"
    fill_in "Confirm Password", with: "abracadabra"

    click_button 'Create User'

    expect(current_path).to eq(user_path(User.last))

   
    expect(page).to have_text('Thanks for signing up!')
  end

  it "does not save the user if it's invalid" do
    visit signup_url

    expect {
      click_button 'Create User'
    }.not_to change(User, :count)

    expect(page).to have_text('error')
  end

  it "saves the user and shows the user's profile page" do    
  # existing code

  expect(page).not_to have_link('Sign In')
  expect(page).not_to have_link('Sign Up')
 end

 
end